import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/features/reciept/cubit/recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocBuilder<RecipeCubit, RecipeState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return gapH4;
                },
                loadSuccess: (recipeRoot) {
                  return Column(
                    children: [
                      gapH20,
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(recipeRoot.recipes![index].name!),
                                    Text("${recipeRoot.recipes![index].portionQuantity} Porsiyon"),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text("Toplam Karbonhidrat"),
                                    Text("${recipeRoot.recipes![index].totalCarb!.toStringAsFixed(2)} G.")
                                  ],
                                )
                              ],
                            );
                          },
                          itemCount: recipeRoot.recipes!.length,
                        ),
                      ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ),
      ),
    );
  }
}
