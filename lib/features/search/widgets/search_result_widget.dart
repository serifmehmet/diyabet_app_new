import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:diyabet_app/features/totals/cubit/totals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/input/carbapp_text_input.dart';
import '../../../domain/entities/cache_food_list_item.dart';
import '../../../domain/entities/remote_food_root.dart';
import '../../food/cubit/food_cubit.dart';
import '../../food/cubit/food_unit_cubit.dart';

class SearchResultWidget extends StatefulWidget {
  final List<CacheFoodListItem?> foodEntity;

  const SearchResultWidget({Key? key, required this.foodEntity}) : super(key: key);

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  String? dropDownValue;
  double? carbValue;
  TextEditingController quantityController = TextEditingController();
  String onChangedValue = "1";

  @override
  void initState() {
    quantityController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                showModal(widget.foodEntity[index]!.Id!, context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.foodEntity[index]!.Name!,
                        style: Theme.of(context).textTheme.orangeText,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: 1,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
            ),
          );
        },
        itemCount: widget.foodEntity.length);
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

  Widget bottomSheetContent(BuildContext context, RemoteFoodRoot remoteFood) {
    return StatefulBuilder(
      builder: (context, setStateChild) {
        return SizedBox(
          height: 600,
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              children: [
                bottomSheetHeader(context),
                const SizedBox(height: 30),
                Padding(
                  padding: context.paddingNormal,
                  child: bottomSheetLowerSide(context, remoteFood, setStateChild),
                )
              ],
            ),
          ),
        );
      },
    );
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
              child: DropdownButton(
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
                  setter(() {
                    dropDownValue = value!;
                    BlocProvider.of<FoodUnitCubit>(context).changeSelectedFoodUnit(value, remoteFood.FoodUnits, quantityController.text);
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
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                inputTextStyle: Theme.of(context).textTheme.headline4,
                inputBorderRadius: 24,
                inputText: "1",
                textController: quantityController,
                onChanged: (value) {
                  if (value != "") {
                    BlocProvider.of<FoodUnitCubit>(context).changeCarbValue(value);
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
                        state.newCarbValue.toString() + " Gr.",
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
                        state.newCarbValue.toString() + " Gr.",
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
            LocalFood localFood = LocalFood(
              Id: remoteFood.Food!.Id!,
              CarbTotal: int.parse(quantityController.text) * (context.read<FoodUnitCubit>().selectedUnit.CarbValue!),
              FoodName: remoteFood.Food!.Name!,
              Quantity: int.parse(quantityController.text),
              UnitType: context.read<FoodUnitCubit>().selectedUnit.UnitName,
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

  showModal(int foodId, BuildContext foodContext) {
    BlocProvider.of<FoodCubit>(foodContext).getFoodOnId(foodId);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      builder: (context) {
        return BlocBuilder<FoodCubit, FoodState>(
          builder: (context, state) {
            if (state is SingleFoodLoading) {
              return const CircularProgressIndicator();
            }

            if (state is SingleFoodLoadSuccess) {
              return bottomSheetContent(context, state.remoteFood!);
            }

            return Container();
          },
        );
      },
    ).whenComplete(() {
      quantityController.text = "1";
      BlocProvider.of<FoodUnitCubit>(context).clearUnits();
    });
  }
}
