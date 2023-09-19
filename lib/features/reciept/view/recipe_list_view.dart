import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/bottom_sheet/add_recipe_to_consumption_bottomsheet_widget.dart';
import 'package:diyabet_app/core/theme_widgets/bottom_sheet/recipe_detail_bottomsheet_widget.dart';
import 'package:diyabet_app/core/theme_widgets/dialog/alert_dialogs.dart';
import 'package:diyabet_app/features/reciept/cubit/recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/app_sizes.dart';

class RecipeListView extends StatefulWidget {
  const RecipeListView({Key? key}) : super(key: key);

  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  @override
  void initState() {
    BlocProvider.of<RecipeCubit>(context).getRemoteRecipeByUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xff000000),
        ),
        title: Text("Tariflerim", style: Theme.of(context).textTheme.genericHeader),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: BlocConsumer<RecipeCubit, RecipeState>(
            listener: (context, state) {
              if (state is RecipeSaveSuccess) {
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return gapH4;
                },
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
                                      IconButton(
                                        onPressed: () {
                                          final result = showAlertDialogDefault(
                                            context: context,
                                            title: 'Tarif Silme',
                                            cancelActionText: "İptal",
                                            defaultActionText: "Eminim",
                                            content: SizedBox(
                                              height: 70,
                                              child: Center(
                                                child: Text(
                                                  "Tarifi silmek üzeresiniz, emin misiniz?",
                                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                        color: const Color(
                                                          0xff000000,
                                                        ),
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ).then((value) {
                                            if (value!) {
                                              BlocProvider.of<RecipeCubit>(context).deleteRemoteRecipe(
                                                recipeId: recipeRoot.recipes![index].id!,
                                              );
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          IconlyBold.delete,
                                          color: Theme.of(context).colorScheme.error,
                                        ),
                                      ),
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
                                                    height: 350,
                                                    child: AddRecipeToConsumptionBottomSheetWidget(
                                                      recipe: recipeRoot.recipes![index],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child:
                                                Text("Ekle", style: Theme.of(context).textTheme.recipeListButtonText),
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
                      ],
                    ),
                  );
                },
                getRecipeFailure: (failure) {
                  return Center(child: Text(failure.errorMessage));
                },
                loading: () => const Center(child: CircularProgressIndicator.adaptive()),
              );
            },
          ),
        ),
      ),
    );
  }
}
