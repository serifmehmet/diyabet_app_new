import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/domain/entities/food.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchResultWidget extends StatelessWidget {
  final Food? foodEntity;

  const SearchResultWidget({Key? key, this.foodEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  foodEntity!.items![index].name!,
                  style: Theme.of(context).textTheme.orangeText,
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return bottomSheetContent(context, index);
                      },
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: 1,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
            ),
          );
        },
        itemCount: foodEntity!.items!.length);
  }

  Row bottomSheetHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 24,
            color: Color(0xff000000),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyBold.info_circle,
            size: 24,
            color: Theme.of(context).colorScheme.secondaryVariant,
          ),
        ),
      ],
    );
  }

  SizedBox bottomSheetContent(BuildContext context, int index) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            bottomSheetHeader(context),
            const SizedBox(height: 30),
            Padding(
              padding: context.paddingNormal,
              child: bottomSheetLowerSide(context, index),
            )
          ],
        ),
      ),
    );
  }

  Column bottomSheetLowerSide(BuildContext context, int index) {
    return Column(
      children: [
        Text(
          foodEntity!.items![0].name!,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 50),
        CarbAppTextInput(
          inputIcon: IconlyLight.arrow_down_circle,
          iconSize: 24,
          iconColor: const Color(0xff000000),
          inputTextStyle: Theme.of(context).textTheme.headline4,
          inputBorderRadius: 24,
          inputText: "Birim Seçin",
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150,
              child: CarbAppTextInput(
                inputTextStyle: Theme.of(context).textTheme.headline4,
                inputBorderRadius: 24,
                inputText: "Miktar",
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Karbonhidrat", style: Theme.of(context).textTheme.headline5),
                Text(
                  foodEntity!.items![index].carbohydratesTotalG.toString() + "Gr.",
                  style: const TextStyle(
                    color: Color(0xff0e150e),
                    fontSize: 30,
                    fontFamily: "Signika",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 100),
        ElevatedButton(
          onPressed: () {},
          child: const Center(
            child: Text("Ekle"),
          ),
          style: ElevatedButton.styleFrom(elevation: 0),
        ),
      ],
    );
  }
}
