import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/ui/search/cubit/search_cubit.dart';
import 'package:diyabet_app/ui/search/widgets/search_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/input/carbapp_search_input.dart';
import '../../home/view/tab/model/food_model.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  var items = FoodModels.create();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarbAppSearchInput(
              inputText: "Gıda ara...",
              inputIcon: IconlyLight.search,
              iconSize: 16,
              iconColor: Theme.of(context).colorScheme.secondaryVariant,
              inputTextStyle: Theme.of(context).textTheme.headline4,
              inputBorderRadius: 24,
              onChanged: (value) {
                context.read<SearchCubit>().getSearchItem(value);
              },
            ),
            const SizedBox(
              height: 46,
            ),
            Text(
              "Arama Sonuçları",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 32),
            BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SearchInitial) {
                  return Container();
                }

                if (state is Searching) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is SearchSuccess) {
                  return Expanded(
                    child: SearchResultWidget(
                      foodEntity: state.food,
                    ),
                  );
                  // return searchSuccess(state);

                }

                return const SizedBox();
              },
            ),
            const SizedBox(height: 60),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Tarif Ekle   +",
                style: Theme.of(context).textTheme.addRecipeText,
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              height: 1,
              color: Color(0xffF5F5F5),
            ),
          ],
        ),
      ),
    );
  }

  // Expanded searchSuccess(SearchSuccess state) {
  //   return Expanded(
  //     child: ListView.separated(
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(state.food!.items![0].name!, style: Theme.of(context).textTheme.orangeText),
  //               IconButton(
  //                 onPressed: () {
  //                   showModalBottomSheet(
  //                     context: context,
  //                     shape: const RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
  //                     ),
  //                     isScrollControlled: true,
  //                     builder: (BuildContext context) {
  //                       return bottomSheetContent(context, state);
  //                     },
  //                   );
  //                 },
  //                 icon: Icon(
  //                   Icons.add,
  //                   color: Theme.of(context).colorScheme.secondary,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //       itemCount: state.food!.items!.length,
  //       separatorBuilder: (BuildContext context, int index) {
  //         return Container(
  //           width: double.infinity,
  //           height: 1,
  //           decoration: const BoxDecoration(
  //             color: Color(0xffF5F5F5),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // SizedBox bottomSheetContent(BuildContext context, SearchSuccess state) {
  //   return SizedBox(
  //     height: 600,
  //     child: Padding(
  //       padding: context.paddingNormal,
  //       child: Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               IconButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 icon: const Icon(
  //                   Icons.close,
  //                   size: 24,
  //                   color: Color(0xff000000),
  //                 ),
  //               ),
  //               IconButton(
  //                 onPressed: () {},
  //                 icon: Icon(
  //                   IconlyBold.info_circle,
  //                   size: 24,
  //                   color: Theme.of(context).colorScheme.secondaryVariant,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 30),
  //           Text(
  //             state.food!.items![0].name!,
  //             style: Theme.of(context).textTheme.headline3,
  //           ),
  //           const SizedBox(height: 50),
  //           CarbAppTextInput(
  //             inputIcon: IconlyLight.arrow_down_circle,
  //             iconSize: 24,
  //             iconColor: Color(0xff000000),
  //             inputTextStyle: Theme.of(context).textTheme.headline4,
  //             inputBorderRadius: 24,
  //             inputText: "Birim Seçin",
  //           ),
  //           const SizedBox(height: 20),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               SizedBox(
  //                 width: 150,
  //                 child: CarbAppTextInput(
  //                   inputTextStyle: Theme.of(context).textTheme.headline4,
  //                   inputBorderRadius: 24,
  //                   inputText: "Miktar",
  //                 ),
  //               ),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Text("Karbonhidrat", style: Theme.of(context).textTheme.headline5),
  //                   Text(
  //                     state.food!.items![0].carbohydratesTotalG.toString() + "Gr.",
  //                     style: const TextStyle(
  //                       color: Color(0xff0e150e),
  //                       fontSize: 30,
  //                       fontFamily: "Signika",
  //                       fontWeight: FontWeight.w400,
  //                       fontStyle: FontStyle.normal,
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //           const SizedBox(height: 100),
  //           ElevatedButton(
  //             onPressed: () {},
  //             child: const Center(
  //               child: Text("Ekle"),
  //             ),
  //             style: ElevatedButton.styleFrom(elevation: 0),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
