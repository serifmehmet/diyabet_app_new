import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/features/reciept/cubit/recipe_food_search_cubit.dart';
import 'package:diyabet_app/features/reciept/widgets/recipe_search_results_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/theme_widgets/input/carbapp_search_input.dart';

class SearchResultBoxWidget extends StatelessWidget {
  SearchResultBoxWidget({Key? key}) : super(key: key);
  String? lastSearchedFood;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<RecipeFoodSearchCubit, RecipeFoodSearchState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return gapH4;
              },
              success: (foodList) {
                return RecipeSearchResultsWidget(foodList: foodList);
              },
              loading: () => const CircularProgressIndicator(),
              initial: () {
                return Container();
              },
            );
          },
        ),
        CarbAppSearchInput(
          key: const Key("initial"),
          inputText: "Besin ara...",
          inputTextStyle: Theme.of(context).textTheme.headline4,
          inputIcon: IconlyLight.search,
          iconSize: 16,
          iconColor: Theme.of(context).colorScheme.secondaryContainer,
          inputBorderRadius: 24,
          onChanged: (value) {
            if (value.isNotEmpty && lastSearchedFood != value) {
              lastSearchedFood = value;
              BlocProvider.of<RecipeFoodSearchCubit>(context).searchFoodItemForRecipe(value);
            } else if (value.isEmpty) {
              FocusManager.instance.primaryFocus!.unfocus();
              BlocProvider.of<RecipeFoodSearchCubit>(context).clearFoodSearch();
            }
          },
        ),
      ],
    );
  }
}
