import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../models/calc_report_model.dart';
import '../widgets/calc_tile_widget.dart';

class CalcReportView extends StatelessWidget {
  CalcReportView({Key? key}) : super(key: key);
  var items = CalculatedItemsModel.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Text(
              "Geçmiş Kayıtlarım",
              style: Theme.of(context).textTheme.genericHeader,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bugün",
                  style: Theme.of(context).textTheme.genericHeaderBig,
                ),
                IconButton(
                  icon: const Icon(IconlyLight.calendar),
                  onPressed: () {},
                  iconSize: 32,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: CalcTileWidget(
                itemsModel: items,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
