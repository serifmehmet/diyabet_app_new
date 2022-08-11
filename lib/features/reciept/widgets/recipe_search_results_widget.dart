import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/domain/entities/cache_food_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme_widgets/bottom_sheet/bottom_sheet_widget.dart';
import '../../food/cubit/food_unit_cubit.dart';

class RecipeSearchResultsWidget extends StatelessWidget {
  const RecipeSearchResultsWidget({Key? key, required this.foodList}) : super(key: key);
  final List<CacheFoodListItem> foodList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.only(top: 50),
      decoration: const BoxDecoration(
        color: Color(0xffF4F4F4),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Arama sonuçları",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                itemCount: foodList.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                          ),
                          isScrollControlled: true,
                          builder: (context) {
                            return BottomSheetWidget(
                              foodId: foodList[index].Id!,
                              type: BottomSheetType.receipt,
                            );
                          }).whenComplete(
                        () => BlocProvider.of<FoodUnitCubit>(context).clearUnits(),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                foodList[index].Name!,
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
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
