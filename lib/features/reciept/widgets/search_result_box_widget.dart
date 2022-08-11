import 'package:diyabet_app/features/reciept/widgets/recipe_search_results_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/theme_widgets/input/carbapp_search_input.dart';
import '../cubit/reciept_cubit.dart';

class SearchResultBoxWidget extends StatelessWidget {
  SearchResultBoxWidget({Key? key}) : super(key: key);
  String? lastSearchedFood;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<FoodSearchCubit, FoodSearchState>(
          builder: (context, state) {
            switch (state.status) {
              case FoodSearchStatus.success:
                return RecipeSearchResultsWidget(foodList: state.foodList);
              case FoodSearchStatus.initial:
                return Container();
              case FoodSearchStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case FoodSearchStatus.failure:
                return Container();
            }
          },
        ),
        CarbAppSearchInput(
          inputText: "Besin ara...",
          inputTextStyle: Theme.of(context).textTheme.headline4,
          inputIcon: IconlyLight.search,
          iconSize: 16,
          iconColor: Theme.of(context).colorScheme.secondaryContainer,
          inputBorderRadius: 24,
          onChanged: (value) {
            if (value.isNotEmpty && lastSearchedFood != value) {
              lastSearchedFood = value;
              BlocProvider.of<FoodSearchCubit>(context).searchFoodItemForReciept(value);
            } else if (value.isEmpty) {
              FocusManager.instance.primaryFocus!.unfocus();
              BlocProvider.of<FoodSearchCubit>(context).clearFoodSeach();
            }
          },
        ),
      ],
    );
  }
}
