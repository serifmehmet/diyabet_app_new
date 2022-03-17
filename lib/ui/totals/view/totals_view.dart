import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/ui/totals/view/models/total_items_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        firstRow(index, context),
                        secondRow(index, context),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                    ),
                  );
                },
                itemCount: items.totalItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row secondRow(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          items.totalItems[index].itemUnit!,
          style: Theme.of(context).textTheme.inputLabel,
        ),
        Text(
          items.totalItems[index].totalCarb.toString() + " Gr.",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Row firstRow(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          items.totalItems[index].itemName!,
          style: Theme.of(context).textTheme.addRecipeText,
        ),
        actionIcons(context),
      ],
    );
  }

  Row actionIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            IconlyLight.edit,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
          onPressed: () {},
          constraints: const BoxConstraints(
            maxWidth: 26,
            maxHeight: 26,
          ),
          padding: EdgeInsets.zero,
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconlyLight.delete,
            color: Colors.red,
            size: 24,
          ),
          constraints: const BoxConstraints(
            maxWidth: 26,
            maxHeight: 26,
          ),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
