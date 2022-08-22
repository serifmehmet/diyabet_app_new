import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/dialog/alert_dialogs.dart';
import 'package:diyabet_app/core/theme_widgets/list/food_list_widget.dart';
import 'package:diyabet_app/features/reciept/cubit/reciept_cubit.dart';
import 'package:diyabet_app/features/reciept/widgets/save_recipe_dialog_content_widget.dart';
import 'package:diyabet_app/features/reciept/widgets/search_result_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diyabet_app/injection_container.dart' as di;

class AddRecieptView extends StatelessWidget {
  const AddRecieptView({Key? key}) : super(key: key);

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
                  Text("Tarife Eklenen Besinler", style: Theme.of(context).textTheme.genericHeader),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<RecipeCubit, RecipeState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case RecipeStatus.addFoodSuccess:
                        case RecipeStatus.foodDeletedSuccess:
                          return Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                gapH12,
                                Text("Toplam karbonhidrat:", style: Theme.of(context).textTheme.headline5),
                                gapH8,
                                Text("${state.carbValue.toStringAsFixed(2)} G.", style: Theme.of(context).textTheme.carbValueText),
                                gapH12,
                                Expanded(
                                  child: FoodListWidget(
                                    savedFoods: state.foodsAdded,
                                    foodListType: FoodListType.recipe,
                                  ),
                                ),
                              ],
                            ),
                          );

                        default:
                          return Center(
                            child: Container(
                              child: Text(
                                "Tarif oluşturmak için besin eklemelisiniz.",
                                style: Theme.of(context).textTheme.genericHeader,
                              ),
                            ),
                          );
                      }
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
              child: BlocProvider(
                create: (foodSearchContext) => di.sl<FoodSearchCubit>(),
                child: SearchResultBoxWidget(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: BlocBuilder<RecipeCubit, RecipeState>(
              builder: (context, state) {
                switch (state.status) {
                  case RecipeStatus.addFoodSuccess:
                  case RecipeStatus.foodDeletedSuccess:
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

                  default:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
