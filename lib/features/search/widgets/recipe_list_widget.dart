import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/theme_widgets/bottom_sheet/add_recipe_to_consumption_bottomsheet_widget.dart';
import '../../../core/theme_widgets/bottom_sheet/recipe_detail_bottomsheet_widget.dart';
import '../../reciept/cubit/recipe_cubit.dart';

class RecipeListWidget extends StatelessWidget {
  const RecipeListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeCubit, RecipeState>(
      listener: (context, state) {
        if (state is RecipeSaveSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => gapH4,
          recipeListInitial: () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("Henüz bir tarif eklemediniz."),
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    NavigationService.instance.navigateToPage(
                      path: NavigationConstants.ADD_RECIEPT,
                    );
                  },
                  child: Text(
                    "Tarif Ekle +",
                    style: Theme.of(context).textTheme.addRecipeText,
                  ),
                )
              ],
            );
          },
          loadSuccess: (recipeRoot) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
              child: Column(
                children: [
                  gapH20,
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(height: 10, color: Colors.grey.shade400);
                      },
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  recipeRoot.recipes![index].name!,
                                  style: Theme.of(context).textTheme.recipeListName,
                                ),
                                Text(
                                  "${recipeRoot.recipes![index].portionQuantity} ${recipeRoot.recipes![index].recipeUnit}",
                                  style: Theme.of(context).textTheme.recipeListPortionName,
                                ),
                                // recipeRoot.recipes![index].isApproved!
                                //     ? Text("Onaylandı", style: Theme.of(context).textTheme.recipeListApproved)
                                //     : Text("Onaylanmadı", style: Theme.of(context).textTheme.recipeListNotApproved),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text("Toplam Karbonhidrat"),
                                Text(
                                  "${recipeRoot.recipes![index].totalCarb!.toStringAsFixed(2)} g",
                                  style: Theme.of(context).textTheme.recipeCarbValue,
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffD6578A),
                                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
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
                                            return SizedBox(
                                              height: 350,
                                              child: RecipeDetailBottomSheetWidget(
                                                recipeFoods: recipeRoot.recipes![index].recipeFoods!,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text("Tarif İçeriği",
                                          style: Theme.of(context).textTheme.recipeListButtonText),
                                    ),
                                    gapW4,
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).colorScheme.tertiary,
                                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
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
                                            return SizedBox(
                                              height: 400,
                                              child: AddRecipeToConsumptionBottomSheetWidget(
                                                recipe: recipeRoot.recipes![index],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text("Ekle", style: Theme.of(context).textTheme.recipeListButtonText),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        );
                      },
                      itemCount: recipeRoot.recipes!.length,
                    ),
                  ),
                  if (CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN)) ...[
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          "Tarif Ekle   +",
                          style: Theme.of(context).textTheme.addRecipeText,
                        ),
                        onPressed: () {
                          NavigationService.instance.navigateToPage(path: NavigationConstants.ADD_RECIEPT);
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ],
              ),
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
      },
    );
  }
}
