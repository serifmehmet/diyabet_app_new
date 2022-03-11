import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/card/main_subheader_widget.dart';
import 'package:diyabet_app/features/home/view/tab/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  var items = FoodModels.create();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        actions: const [
          // IconButton(
          //   onPressed: () {
          //     NavigationService.instance.navigateToPage(path: NavigationConstants.PROFILE);
          //   },
          //   icon: Icon(
          //     Icons.menu,
          //     size: 40,
          //     color: Theme.of(context).colorScheme.secondaryVariant,
          //   ),
          // ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Merhaba, Konuk",
              style: Theme.of(context).textTheme.welcomeText,
            ),
          ),
          Center(
            child: Text(
              "Karbonhidrat hesaplamak için yemek ekleyerek başlayabilirsin.",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MainSubHeaderWidget(),
          // subHeaderArea(context),
          const SizedBox(
            height: 30,
          ),
          Text(
            "En Çok Eklenen Gıdalar",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 30,
          ),
          favoriteFoodList()
        ],
      ),
    );
  }

  Expanded favoriteFoodList() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(items.foodItems[index].name,
                    style: Theme.of(context).textTheme.orangeText),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ],
            ),
          );
        },
        itemCount: items.foodItems.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: 1,
            decoration: const BoxDecoration(
              color: Color(0xffF5F5F5),
            ),
          );
        },
      ),
    );
  }

  Container subHeaderArea(BuildContext context) {
    return Container();
    // return Container(
    //   height: 88,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //     color: Theme.of(context).colorScheme.primaryVariant,
    //     borderRadius: const BorderRadius.all(
    //       Radius.circular(15),
    //     ),
    //   ),
    //   child: Stack(
    //     children: [
    //       subHeaderLeftSide(context),
    //       subHeaderRightSide(context),
    //     ],
    //   ),
    // );
  }

  // Row subHeaderRightSide(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       Container(
  //         width: context.width * 0.48,
  //         height: double.infinity,
  //         child: Padding(
  //           padding: context.paddingNormal,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               // Login button
  //               ElevatedButton(
  //                 onPressed: () {
  //                   NavigationService.instance.navigateToPage(path: NavigationConstants.LOGIN);
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   primary: const Color(0xffffffff),
  //                   elevation: 0,
  //                   padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 22),
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       "Giriş Yap",
  //                       style: Theme.of(context).textTheme.homepageLoginButton,
  //                     ),
  //                     const SizedBox(
  //                       width: 10,
  //                     ),
  //                     const Icon(
  //                       IconlyBold.arrow_right_2,
  //                       color: Color(0xff9E9BC7),
  //                       size: 12,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         decoration: const BoxDecoration(
  //           color: Color(0xffA3A0CA),
  //           borderRadius: BorderRadius.only(
  //             bottomLeft: Radius.circular(70),
  //             topRight: Radius.circular(15),
  //             bottomRight: Radius.circular(15),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Container subHeaderLeftSide(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     child: Padding(
  //       padding: EdgeInsets.only(top: 15, bottom: 15, left: 19),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           SizedBox(
  //             width: context.width * 0.40,
  //             child: Text("Günlük tüketim ve hesaplamalarını kaydetmek için giriş yap.", style: Theme.of(context).textTheme.subtitle1),
  //           ),
  //         ],
  //       ),
  //     ),
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).colorScheme.primaryVariant,
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(15),
  //       ),
  //     ),
  //   );
  // }
}
