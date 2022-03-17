import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/ui/calc_report/models/calc_report_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CalcTileWidget extends StatefulWidget {
  const CalcTileWidget({Key? key, this.itemsModel}) : super(key: key);

  final CalculatedItemsModel? itemsModel;

  @override
  State<CalcTileWidget> createState() => _CalcTileWidgetState();
}

class _CalcTileWidgetState extends State<CalcTileWidget> {
  //SelectedITile index
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: Key('builder ${selected.toString()}'),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: widget.itemsModel!.calcItems.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTileTheme(
            tileColor: const Color(0xfff5f5f5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            // data: Theme.of(context).copyWith(dividerColor: Colors.transparent, dividerTheme: DividerThemeData(color: Colors.black)),
            child: ExpansionTile(
              key: Key(index.toString()),
              initiallyExpanded: index == selected,
              onExpansionChanged: ((newState) {
                if (newState) {
                  setState(() {
                    const Duration(seconds: 20000);
                    selected = index;
                  });
                } else {
                  setState(() {
                    selected = -1;
                  });
                }
              }),
              title: Text(
                widget.itemsModel!.calcItems[index].repast!,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: trailingArea(index, context),
              children: [
                innerListView(index),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(5),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                  onPressed: () {},
                  child: Text(
                    "Bolus Hesapla",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget innerListView(int index) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.itemsModel!.calcItems[index].foodsOnRepast![i].itemName!,
                    style: Theme.of(context).textTheme.addRecipeText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.itemsModel!.calcItems[index].foodsOnRepast![i].itemUnit!,
                    style: Theme.of(context).textTheme.inputLabel,
                  ),
                  Text(
                    widget.itemsModel!.calcItems[index].foodsOnRepast![i].totalCarb.toString() + " Gr.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
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
      itemCount: widget.itemsModel!.calcItems[index].foodsOnRepast!.length,
    );
  }

  Widget trailingArea(int index, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Toplam: " + widget.itemsModel!.calcItems[index].totalCarb.toString() + " Gr.",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              "Bolus: " + widget.itemsModel!.calcItems[index].totalBolus.toString() + " Ünite",
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
        const SizedBox(width: 20),
        const Icon(IconlyLight.arrow_down_circle, color: Colors.black),
      ],
    );
  }
}
