import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/domain/entities/recipe_food.dart';
import 'package:flutter/material.dart';

class RecipeDetailBottomSheetWidget extends StatelessWidget {
  const RecipeDetailBottomSheetWidget({Key? key, required this.recipeFoods}) : super(key: key);

  final List<RecipeFood> recipeFoods;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Tarif Detayları",
            style: Theme.of(context).textTheme.recipeDetailHeader,
          ),
          gapH16,
          Expanded(
            child: ListView.separated(
              itemBuilder: ((context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            recipeFoods[index].foodName!,
                            style: Theme.of(context).textTheme.recipeListName,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${recipeFoods[index].quantity} ${recipeFoods[index].unitName!}",
                          style: Theme.of(context).textTheme.recipeListPortionName,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Karbonhidrat"),
                        Text(
                          "${recipeFoods[index].carbValue} G.",
                          style: Theme.of(context).textTheme.recipeCarbValue,
                        ),
                      ],
                    )
                  ],
                );
              }),
              separatorBuilder: (context, int index) {
                return Divider(
                  color: Colors.grey.shade300,
                  height: 10,
                );
              },
              itemCount: recipeFoods.length,
            ),
          ),
        ],
      ),
    );
  }
}
