import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/domain/entities/food.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchResultWidget extends StatefulWidget {
  final Food? foodEntity;

  const SearchResultWidget({Key? key, this.foodEntity}) : super(key: key);

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  var items = ["Adet", "Gr", "Birim Seçiniz."];

  String dropDownValue = "Birim Seçiniz.";
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
                  widget.foodEntity!.items![index].name!,
                  style: Theme.of(context).textTheme.orangeText,
                ),
                IconButton(
                  onPressed: () {
                    showModal(index);
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
        itemCount: widget.foodEntity!.items!.length);
  }

  Widget bottomSheetHeader(BuildContext context) {
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

  Widget bottomSheetContent(BuildContext context, int index, StateSetter setter) {
    return StatefulBuilder(
      builder: (context, setStateChild) {
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
                  child: bottomSheetLowerSide(context, index, setter),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bottomSheetLowerSide(BuildContext context, int index, StateSetter setter) {
    return Column(
      children: [
        Text(
          widget.foodEntity!.items![0].name!,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 50),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Theme.of(context).colorScheme.copyWith(background: const Color(0xfff4f4f4)).background,
          ),
          child: Padding(
            padding: context.paddingLow,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                icon: const Icon(
                  IconlyLight.arrow_down_circle,
                  color: Color(0xFF000000),
                  size: 24,
                ),
                items: items.map((itemName) {
                  return DropdownMenuItem(
                    value: itemName,
                    child: Text(
                      itemName,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setter(() {
                    dropDownValue = value!;
                  });
                },
                value: dropDownValue,
              ),
            ),
          ),
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
                inputText: "1",
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Karbonhidrat", style: Theme.of(context).textTheme.headline5),
                Text(
                  widget.foodEntity!.items![index].carbohydratesTotalG.toString() + "Gr.",
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

  showModal(int index) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setStateChild) {
          return bottomSheetContent(context, index, setStateChild);
        });
      },
    );
  }
}
