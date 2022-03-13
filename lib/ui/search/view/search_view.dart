import 'package:flutter/material.dart';
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
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 46,
            ),
            Text(
              "Arama Sonuçları",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(items.foodItems[index].name, style: Theme.of(context).textTheme.orangeText),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                                  ),
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                        height: 600,
                                        child: Padding(
                                          padding: context.paddingNormal,
                                          child: Column(
                                            children: [
                                              Row(
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
                                              ),
                                              const SizedBox(height: 30),
                                              Text(
                                                "Havuç",
                                                style: Theme.of(context).textTheme.headline3,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: Center(
                                                  child: Text("Ekle"),
                                                ),
                                                style: ElevatedButton.styleFrom(elevation: 0),
                                              ),
                                            ],
                                          ),
                                        ));
                                  });
                            },
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
}
