import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/dialog/alert_dialogs.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/domain/entities/local_consumption_item.dart';
import 'package:diyabet_app/domain/entities/remote_food.dart';
import 'package:diyabet_app/domain/entities/remote_food_root.dart';
import 'package:diyabet_app/features/food/cubit/food_cubit.dart';
import 'package:diyabet_app/features/food/cubit/food_unit_cubit.dart';
import 'package:diyabet_app/features/reciept/cubit/recipe_food_search_cubit.dart';
import 'package:diyabet_app/features/totals/cubit/totals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../features/reciept/cubit/recipe_cubit.dart';

enum BottomSheetType { search, totals, receipt }

class BottomSheetWidget extends StatefulWidget {
  final int foodId;
  final BottomSheetType type;
  const BottomSheetWidget({Key? key, required this.type, required this.foodId}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController quantityController = TextEditingController();
  final FocusNode _quantityFocusNode = FocusNode();
  String? dropDownValue;

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      actions: [
        KeyboardActionsItem(focusNode: _quantityFocusNode, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  "Tamam",
                  style: TextStyle(
                    color: Color(0xff1BC47D),
                    fontSize: 16,
                    fontFamily: "Signika",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }
        ])
      ],
    );
  }

  @override
  void initState() {
    quantityController.text = "1";
    BlocProvider.of<FoodCubit>(context).getFoodOnId(widget.foodId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, state) {
          if (state is SingleFoodLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SingleFoodLoadSuccess) {
            calculateDropdownValue(state.remoteFood!, context);
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
                      child: StatefulBuilder(
                        builder: (context, setter) {
                          return bottomSheetLowerSide(
                            context,
                            state.remoteFood!,
                            setter,
                          );
                        },
                      ),
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
        remoteFood.foodInfo!.isNotEmpty
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
            : Icon(
                IconlyBold.info_square,
                size: 36,
                color: Colors.grey.shade600,
              ),
      ],
    );
  }

  calculateDropdownValue(RemoteFoodRoot remoteFood, BuildContext context) {
    if (remoteFood.FoodUnits!.length == 1) {
      dropDownValue = remoteFood.FoodUnits![0].UnitName;
      BlocProvider.of<FoodUnitCubit>(context)
          .changeSelectedFoodUnit(dropDownValue!, remoteFood.FoodUnits, quantityController.text);
    }
  }

  Widget bottomSheetLowerSide(BuildContext context, RemoteFoodRoot remoteFood, StateSetter setter) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        children: [
          Text(
            remoteFood.Food!.Name!,
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
                  items: remoteFood.FoodUnits!.map((item) {
                    return DropdownMenuItem(
                      value: item.UnitName,
                      child: Text(
                        item.UnitName!,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setter(
                      () {
                        dropDownValue = value!;
                        BlocProvider.of<FoodUnitCubit>(context)
                            .changeSelectedFoodUnit(value, remoteFood.FoodUnits, quantityController.text);
                      },
                    );
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
                    if (dropDownValue == null) {
                      return;
                    }
                    if (value != "") {
                      BlocProvider.of<FoodUnitCubit>(context).changeCarbValue(value, null);
                    }
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Karbonhidrat", style: Theme.of(context).textTheme.headline5),
                  BlocBuilder<FoodUnitCubit, FoodUnitState>(
                    builder: (context, state) {
                      if (state is SelectedUnitChanged) {
                        return Text(
                          "${state.newCarbValue!.toStringAsFixed(2)} g",
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
                          "${state.newCarbValue!.toStringAsFixed(2)} g",
                          style: const TextStyle(
                            color: Color(0xff0e150e),
                            fontSize: 30,
                            fontFamily: "Signika",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              if (dropDownValue == null) {
                showDialog(
                  context: context,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.of(context).pop(true);
                    });
                    return const AlertDialog(
                      title: Text("Uyarı"),
                      content: Text(
                        "Lütfen önce birim seçiniz",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                );

                return;
              }
              LocalConsumptionItem localFood = LocalConsumptionItem(
                Id: remoteFood.Food!.Id!,
                CarbTotal:
                    int.parse(quantityController.text) * (context.read<FoodUnitCubit>().selectedUnit!.CarbValue!),
                Name: remoteFood.Food!.Name!,
                Quantity: int.parse(quantityController.text),
                UnitType: context.read<FoodUnitCubit>().selectedUnit!.UnitName,
                Index: UniqueKey().hashCode,
                UnitId: context.read<FoodUnitCubit>().selectedUnit!.UnitId,
                ConsumptionType: 1,
              );
              if (widget.type == BottomSheetType.search) {
                BlocProvider.of<TotalsCubit>(context).saveLocalFood(localFood);
              } else if (widget.type == BottomSheetType.receipt) {
                BlocProvider.of<RecipeFoodSearchCubit>(context).clearFoodSearch();
                BlocProvider.of<RecipeCubit>(context).saveLocalFoodToRecipe(localFood);
              }

              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(elevation: 0),
            child: const Center(
              child: Text("Ekle"),
            ),
          ),
        ],
      ),
    );
  }
}
