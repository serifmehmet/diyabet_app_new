import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../constants/navigation/navigation_constants.dart';
import '../../init/navigation/navigation_service.dart';

class NotAuthenticated extends StatelessWidget {
  const NotAuthenticated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "KARBAPP",
              style: Theme.of(context).textTheme.welcomeText,
            ),
            const SizedBox(
              height: 10,
            ),
            const Icon(
              IconlyBold.danger,
              color: Color(0xFFFF0000),
              size: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: subHeaderArea(context),
            ),
          ],
        ),
      ),
    );
  }

  Container subHeaderArea(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          subHeaderLeftSide(context),
          subHeaderRightSide(context),
        ],
      ),
    );
  }

  Row subHeaderRightSide(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: context.width * 0.48,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffDB6896),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: context.paddingNormal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login button
                ElevatedButton(
                  onPressed: () {
                    NavigationService.instance.navigateToPage(path: NavigationConstants.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffffffff),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Giriş Yap",
                        style: Theme.of(context).textTheme.orangeText,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        IconlyBold.arrow_right_2,
                        color: Color(0xffD6578A),
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container subHeaderLeftSide(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFD6578A),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 19),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: context.width * 0.40,
              child: Text("Bu özelliği kullanabilmek için giriş yapmalısınız!", style: Theme.of(context).textTheme.subtitle1),
            ),
          ],
        ),
      ),
    );
  }
}
