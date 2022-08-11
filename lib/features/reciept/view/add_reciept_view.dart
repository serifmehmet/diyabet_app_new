import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/list/food_list_widget.dart';
import 'package:diyabet_app/features/reciept/cubit/reciept_cubit.dart';
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
              height: 300,
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
                          return Expanded(
                            child: FoodListWidget(
                              savedFoods: state.foodsAdded,
                            ),
                          );
                        default:
                          return Container();
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: context.paddingNormal,
              child: ElevatedButton(
                onPressed: () {
                  //Save recipe to local and remote
                },
                child: const Text("Kaydet"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
