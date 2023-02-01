import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:diyabet_app/domain/entities/remote_food.dart';
import 'package:diyabet_app/domain/entities/remote_food_root.dart';
import 'package:diyabet_app/domain/entities/remote_food_unit.dart';
import 'package:diyabet_app/features/food/cubit/food_cubit.dart';
import 'package:diyabet_app/features/food/cubit/food_unit_cubit.dart';
import 'package:diyabet_app/features/totals/cubit/totals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../dialog/alert_dialogs.dart';

class TotalsBottomSheetWidget extends StatefulWidget {
  final int? foodIndex;
  final int? foodId;
  const TotalsBottomSheetWidget({Key? key, this.foodIndex, this.foodId}) : super(key: key);

  @override
  State<TotalsBottomSheetWidget> createState() => _TotalsBottomSheetWidgetState();
}

class _TotalsBottomSheetWidgetState extends State<TotalsBottomSheetWidget> {
  TextEditingController quantityController = TextEditingController();
  final FocusNode _quantityFocusNode = FocusNode();
  String? dropDownValue;

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      actions: [KeyboardActionsItem(focusNode: _quantityFocusNode)],
    );
  }

  @override
  void initState() {
    BlocProvider.of<FoodCubit>(context).getSingleFoodOnIndex(widget.foodIndex!, widget.foodId!).whenComplete(() {
      dropDownValue = context.read<FoodCubit>().localFood!.UnitType!;
      quantityController.text = context.read<FoodCubit>().localFood!.Quantity!.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SizedBox(
        height: 600,
        child: BlocBuilder<FoodCubit, FoodState>(
          builder: (context, state) {
            if (state is SingleFoodLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is EditFoodLoadSuccess) {
              return Padding(
                padding: context.paddingLow,
                child: KeyboardActions(
                  config: _buildConfig(context),
                  child: Column(
                    children: [
                      bottomSheetHeader(context, state.remoteFood!.Food!),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: context.paddingNormal,
                        child: bottomSheetLowerSide(context, state.localFood!, state.remoteFood!, state.remoteFoodUnit, setState),
                      )
                    ],
                  ),
                ),
              );
            }

            return const Center(child: Text("Besin detayı getirilemedi."));
          },
        ),
      );
    });
  }

  Widget bottomSheetHeader(BuildContext context, RemoteFood remoteFood) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              quantityController.text = "1";
            });
            BlocProvider.of<FoodUnitCubit>(context).clearUnits();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 24,
            color: Color(0xff000000),
          ),
        ),
        remoteFood.foodInfo != null
            ? IconButton(
                onPressed: () {
                  showAlertDialogDefault(
                    context: context,
                    title: "Bilgi",
                    cancelActionText: "Kapat",
                    content: SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        child: Text(
                          remoteFood.foodInfo!,
                          style: Theme.of(context).textTheme.inputLabel,
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(
                  IconlyBold.info_square,
                  size: 36,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              )
            : gapH4,
      ],
    );
  }

  Widget bottomSheetLowerSide(
      BuildContext context, LocalFood localFood, RemoteFoodRoot remoteFoodRoot, RemoteFoodUnit? foodUnit, StateSetter setter) {
    return Column(
      children: [
        Text(
          localFood.FoodName!,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 50),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Theme.of(context).colorScheme.copyWith(background: const Color(0xfff4f4f4)).background,
          ),
          child: Padding(
            padding: context.paddingLow,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: const Text("Birim Seçiniz"),
                isExpanded: true,
                icon: const Icon(
                  IconlyLight.arrow_down_circle,
                  color: Color(0xFF000000),
                  size: 24,
                ),
                items: remoteFoodRoot.FoodUnits!.map((item) {
                  return DropdownMenuItem(
                    value: item.UnitName,
                    child: Text(
                      item.UnitName!,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setter(() {
                    dropDownValue = value!;
                    BlocProvider.of<FoodUnitCubit>(context).changeSelectedFoodUnit(value, remoteFoodRoot.FoodUnits, quantityController.text);
                  });
                },
                value: dropDownValue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150,
              child: CarbAppTextInput(
                focuNode: _quantityFocusNode,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                inputTextStyle: Theme.of(context).textTheme.headline4,
                inputBorderRadius: 24,
                inputText: "1",
                textController: quantityController,
                onChanged: (value) {
                  if (value != "") {
                    BlocProvider.of<FoodUnitCubit>(context).changeCarbValue(value, foodUnit);
                  }
                },
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Karbonhidrat", style: Theme.of(context).textTheme.headline5),
              BlocBuilder<FoodUnitCubit, FoodUnitState>(
                builder: (context, state) {
                  if (state is SelectedUnitChanged) {
                    return Text(
                      "${state.newCarbValue!.toStringAsFixed(1)} G.",
                      style: const TextStyle(
                        color: Color(0xff0e150e),
                        fontSize: 30,
                        fontFamily: "Signika",
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    );
                  }

                  if (state is SelectedQuantityChanged) {
                    return Text(
                      "${state.newCarbValue!.toStringAsFixed(1)} G.",
                      style: const TextStyle(
                        color: Color(0xff0e150e),
                        fontSize: 30,
                        fontFamily: "Signika",
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    );
                  }

                  return Text(
                    "${localFood.CarbTotal!.toStringAsFixed(1)} G.",
                    style: const TextStyle(
                      color: Color(0xff0e150e),
                      fontSize: 30,
                      fontFamily: "Signika",
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  );
                },
              ),
            ])
          ],
        ),
        const SizedBox(height: 100),
        ElevatedButton(
          onPressed: () {
            LocalFood localFoodToUpdate = LocalFood(
              Id: localFood.Id,
              CarbTotal: int.parse(quantityController.text) * (context.read<FoodUnitCubit>().selectedUnit!.CarbValue!),
              FoodName: localFood.FoodName,
              Quantity: int.parse(quantityController.text),
              UnitType: context.read<FoodUnitCubit>().selectedUnit!.UnitName,
              Index: localFood.Index,
            );

            BlocProvider.of<TotalsCubit>(context).updateLocalFood(localFoodToUpdate);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(elevation: 0),
          child: const Center(
            child: Text("Güncelle"),
          ),
        ),
      ],
    );
  }
}
