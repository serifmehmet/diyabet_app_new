import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:diyabet_app/domain/entities/remote_food_root.dart';
import 'package:diyabet_app/features/food/cubit/food_cubit.dart';
import 'package:diyabet_app/features/food/cubit/food_unit_cubit.dart';
import 'package:diyabet_app/features/totals/cubit/totals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class BottomSheetWidget extends StatefulWidget {
  final int foodId;
  const BottomSheetWidget({Key? key, required this.foodId}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController quantityController = TextEditingController();
  String? dropDownValue;
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
    return StatefulBuilder(
      builder: (context, setState) {
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
                return Padding(
                  padding: context.paddingLow,
                  child: Column(
                    children: [
                      bottomSheetHeader(context),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: context.paddingNormal,
                        child: bottomSheetLowerSide(
                          context,
                          state.remoteFood!,
                          setState,
                        ),
                      )
                    ],
                  ),
                );
              }

              return const Center(child: Text("Besin detayı getirilemedi."));
            },
          ),
        );
      },
    );
  }

  Widget bottomSheetHeader(BuildContext context) {
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
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyBold.info_circle,
            size: 24,
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
      ],
    );
  }

  calculateDropdownValue(RemoteFoodRoot remoteFood, BuildContext context) {
    if (remoteFood.FoodUnits!.length == 1) {
      dropDownValue = remoteFood.FoodUnits![0].UnitName;
      BlocProvider.of<FoodUnitCubit>(context).changeSelectedFoodUnit(dropDownValue!, remoteFood.FoodUnits, quantityController.text);
    } else {
      dropDownValue = "";
    }
  }

  Widget bottomSheetLowerSide(BuildContext context, RemoteFoodRoot remoteFood, StateSetter setter) {
    return Column(
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
                      BlocProvider.of<FoodUnitCubit>(context).changeSelectedFoodUnit(value, remoteFood.FoodUnits, quantityController.text);
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
                        state.newCarbValue!.toStringAsFixed(1) + " Gr.",
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
                        state.newCarbValue!.toStringAsFixed(1) + " Gr.",
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
            LocalFood localFood = LocalFood(
              Id: remoteFood.Food!.Id!,
              CarbTotal: int.parse(quantityController.text) * (context.read<FoodUnitCubit>().selectedUnit!.CarbValue!),
              FoodName: remoteFood.Food!.Name!,
              Quantity: int.parse(quantityController.text),
              UnitType: context.read<FoodUnitCubit>().selectedUnit!.UnitName,
              Index: UniqueKey().hashCode,
              UnitId: context.read<FoodUnitCubit>().selectedUnit!.UnitId,
            );

            BlocProvider.of<TotalsCubit>(context).saveLocalFood(localFood);
            Navigator.pop(context);
          },
          child: const Center(
            child: Text("Ekle"),
          ),
          style: ElevatedButton.styleFrom(elevation: 0),
        ),
      ],
    );
  }
}
