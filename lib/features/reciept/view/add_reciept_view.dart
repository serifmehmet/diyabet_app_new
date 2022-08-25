import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/list/food_list_widget.dart';
import 'package:diyabet_app/features/reciept/widgets/search_result_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme_widgets/dialog/alert_dialogs.dart';
import '../cubit/recipe_cubit.dart';
import '../widgets/save_recipe_dialog_content_widget.dart';

class AddRecieptView extends StatefulWidget {
  const AddRecieptView({Key? key}) : super(key: key);

  @override
  State<AddRecieptView> createState() => _AddRecieptViewState();
}

class _AddRecieptViewState extends State<AddRecieptView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xff000000),
        ),
        title: Text("Tarif Ekle", style: Theme.of(context).textTheme.genericHeader),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              padding: context.paddingNormal,
              child: Column(
                children: [
                  gapH8,
                  BlocBuilder<RecipeCubit, RecipeState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        foodAddSuccess: (foodsAdded, totalCarb) {
                          return Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text("Tarife Eklenen Besinler", style: Theme.of(context).textTheme.genericHeader),
                                gapH12,
                                Text("Toplam karbonhidrat:", style: Theme.of(context).textTheme.headline5),
                                gapH8,
                                Text("${totalCarb.toStringAsFixed(2)} G.", style: Theme.of(context).textTheme.carbValueText),
                                gapH12,
                                Expanded(
                                  child: FoodListWidget(
                                    savedFoods: foodsAdded,
                                    foodListType: FoodListType.recipe,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        foodDeleteSuccess: (foodsAdded, totalCarb) {
                          return Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                gapH12,
                                Text("Toplam karbonhidrat:", style: Theme.of(context).textTheme.headline5),
                                gapH8,
                                Text("${totalCarb.toStringAsFixed(2)} G.", style: Theme.of(context).textTheme.carbValueText),
                                gapH12,
                                Expanded(
                                  child: FoodListWidget(
                                    savedFoods: foodsAdded,
                                    foodListType: FoodListType.recipe,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        initial: () {
                          return Center(
                            child: SizedBox(
                              height: 300,
                              child: Center(
                                child: Text(
                                  "Tarif oluşturmak için besin eklemelisiniz.",
                                  style: Theme.of(context).textTheme.defaultEmptyWarning,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                        loading: () {
                          return const CircularProgressIndicator.adaptive();
                        },
                        recipeSaveSuccess: (message) {
                          return Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(message, style: Theme.of(context).textTheme.recipeSaveSuccessMessageHeader),
                                gapH12,
                                SizedBox(
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: () {
                                      NavigationService.instance.navigateToPage(path: NavigationConstants.RECIPE_LIST);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
                                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14)),
                                    ),
                                    child: const Text(
                                      "Tariflerimi Görüntüle",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        orElse: () {
                          return gapH4;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              padding: context.paddingNormal,
              child: SearchResultBoxWidget(),
            ),
          ),
          Positioned(
            bottom: 0,
            child: BlocBuilder<RecipeCubit, RecipeState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return gapH4;
                  },
                  recipeSaveSuccess: (message) {
                    return gapH4;
                  },
                  foodAddSuccess: (foods, totalCarb) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: context.paddingNormal,
                      child: ElevatedButton(
                        onPressed: () {
                          //Save recipe to local and remote
                          showAlertDialogDefault(
                            context: context,
                            title: "Tarifi Kaydet",
                            content: const SaveRecipeDialogContent(),
                          );
                        },
                        child: const Text("Kaydet"),
                      ),
                    );
                  },
                  foodDeleteSuccess: (foods, totalCarb) {
                    if (totalCarb > 0) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: context.paddingNormal,
                        child: ElevatedButton(
                          onPressed: () {
                            //Save recipe to local and remote
                            showAlertDialogDefault(
                              context: context,
                              title: "Tarifi Kaydet",
                              content: const SaveRecipeDialogContent(),
                            );
                          },
                          child: const Text("Kaydet"),
                        ),
                      );
                    } else {
                      return gapH4;
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
