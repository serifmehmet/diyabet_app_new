import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/bottom_sheet/totals_bottom_sheet_widget.dart';
import 'package:diyabet_app/domain/entities/local_consumption_item.dart';
import 'package:diyabet_app/features/food/cubit/food_unit_cubit.dart';
import 'package:diyabet_app/features/totals/cubit/totals_cubit.dart';
import 'package:diyabet_app/features/totals/view/models/total_items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../features/reciept/cubit/recipe_cubit.dart';

enum FoodListType { totals, recipe }

class FoodListWidget extends StatelessWidget {
  FoodListWidget({Key? key, this.savedFoods, required this.foodListType}) : super(key: key);
  final FoodListType foodListType;
  final List<LocalConsumptionItem?>? savedFoods;
  var items = TotalsModel.create();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              firstRow(index, context),
              secondRow(index, context),
              thirdRow(index, context),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 1,
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
        );
      },
      itemCount: savedFoods!.length,
    );
  }

  Widget thirdRow(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Text(
        //   "100 gr.",
        //   style: Theme.of(context).textTheme.inputLabel,
        // ),
        Text(
          "${savedFoods![index]!.CarbTotal!.toStringAsFixed(2)} g",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget secondRow(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${savedFoods![index]!.Quantity} ${savedFoods![index]!.UnitType}',
          style: Theme.of(context).textTheme.inputLabel,
        ),
        Text(
          "Karbonhidrat",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  Row firstRow(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            savedFoods![index]!.Name!,
            style: Theme.of(context).textTheme.addRecipeText,
            overflow: TextOverflow.fade,
          ),
        ),
        actionIcons(context, savedFoods![index]!.Index!, savedFoods![index]!.Id!, savedFoods![index]!.Name!),
      ],
    );
  }

  Row actionIcons(BuildContext context, int foodIndex, int foodId, String? foodName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        checkEditButton(context, foodIndex, foodId),
        IconButton(
          onPressed: () {
            if (foodListType == FoodListType.totals) {
              BlocProvider.of<TotalsCubit>(context).deleteSingleFood(foodIndex);
            } else if (foodListType == FoodListType.recipe) {
              BlocProvider.of<RecipeCubit>(context).deleteSingleFood(foodIndex);
            }
          },
          icon: const Icon(
            IconlyLight.delete,
            color: Color(0xFFFF0000),
            size: 24,
          ),
          constraints: const BoxConstraints(
            maxWidth: 26,
            maxHeight: 26,
          ),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget checkEditButton(BuildContext context, int foodIndex, int foodId) {
    if (foodListType == FoodListType.recipe) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    } else {
      return IconButton(
        icon: Icon(
          IconlyLight.edit,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              isScrollControlled: true,
              builder: (context) {
                return TotalsBottomSheetWidget(
                  foodIndex: foodIndex,
                  foodId: foodId,
                );
              }).whenComplete(() => BlocProvider.of<FoodUnitCubit>(context).clearUnits());
        },
        constraints: const BoxConstraints(
          maxWidth: 26,
          maxHeight: 26,
        ),
        padding: EdgeInsets.zero,
      );
    }
  }
}
