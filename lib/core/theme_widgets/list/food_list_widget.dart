import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/ui/totals/view/models/total_items_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FoodListWidget extends StatelessWidget {
  FoodListWidget({Key? key}) : super(key: key);

  var items = TotalsModel.create();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              firstRow(index, context),
              secondRow(index, context),
              thirdRow(index, context),
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
    );
  }

  Widget thirdRow(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "100 gr.",
          style: Theme.of(context).textTheme.inputLabel,
        ),
        Text(
          items.totalItems[index].totalCarb.toString() + " Gr.",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget secondRow(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          items.totalItems[index].itemUnit!,
          style: Theme.of(context).textTheme.inputLabel,
        ),
        Text(
          "Karbonhidrat",
          style: Theme.of(context).textTheme.bodyText2,
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
            color: Color(0xFFFF0000),
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
