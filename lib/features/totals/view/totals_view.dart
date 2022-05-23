import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/list/food_list_widget.dart';
import 'models/total_items_model.dart';

class TotalsView extends StatelessWidget {
  TotalsView({Key? key}) : super(key: key);

  var items = TotalsModel.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Text("Toplam Karbonhidrat", style: Theme.of(context).textTheme.genericHeader),
            const SizedBox(height: 30),
            const Text(
              "18.83 Gr.",
              style: TextStyle(
                color: Color(0xff000000),
                fontFamily: "Signika",
                fontWeight: FontWeight.w600,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                ),
                onPressed: () {},
                child: Text("Hepsini Temizle", style: Theme.of(context).textTheme.overline),
              ),
            ),
            Expanded(child: FoodListWidget()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Kaydet"),
                style: ElevatedButton.styleFrom(elevation: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
