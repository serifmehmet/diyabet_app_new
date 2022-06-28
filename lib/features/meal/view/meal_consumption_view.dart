import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../cubit/meal_consumption_cubit.dart';
import '../models/calc_report_model.dart';
import '../widgets/calc_tile_widget.dart';

class CalcReportView extends StatefulWidget {
  const CalcReportView({Key? key}) : super(key: key);

  @override
  State<CalcReportView> createState() => _CalcReportViewState();
}

class _CalcReportViewState extends State<CalcReportView> {
  var items = CalculatedItemsModel.create();

  DateTime currentDate = DateTime.now();

  DateTime today = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      currentDate: currentDate,
      locale: const Locale("tr"),
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              background: Theme.of(context).backgroundColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (datePicked != null && datePicked != currentDate) {
      context.read<MealConsumptionCubit>().filterDateChanged(datePicked);
      setState(() {
        currentDate = datePicked;
      });
    }
  }

  @override
  void initState() {
    BlocProvider.of<MealConsumptionCubit>(context).getTodayMealList();
    super.initState();
    initializeDateFormatting();
  }

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
              "Besin Tüketim Kayıtlarım",
              style: Theme.of(context).textTheme.genericHeader,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.MMMMEEEEd().format(currentDate) == DateFormat.MMMMEEEEd().format(DateTime.now())
                      ? "Bugün"
                      : DateFormat.yMMMMd("tr").format(currentDate),
                  style: Theme.of(context).textTheme.genericHeaderBig,
                ),
                IconButton(
                  icon: const Icon(IconlyLight.calendar),
                  onPressed: () {
                    _selectDate(context);
                  },
                  iconSize: 32,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<MealConsumptionCubit, MealConsumptionState>(
              builder: (context, state) {
                if (state is TodayMealConsumptionListLoading) {
                  return const CircularProgressIndicator();
                }

                if (state is TodayMealConsumptionListLoadFailure) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(state.errorMessage!, style: Theme.of(context).textTheme.genericHeader),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: context.paddingNormal,
                          child: const Text(
                            "Besin tüketimi hesaplamak için arama ekranına gidebilirsiniz.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  );
                }

                if (state is TodayMealConsumptionListLoadSuccess) {
                  return Expanded(
                    child: CalcTileWidget(
                      mealList: state.meal!.meals,
                    ),
                  );
                }

                if (state is MealConsumptionFilterFailure) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(state.errorMessage!, style: Theme.of(context).textTheme.genericHeader),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: context.paddingNormal,
                          child: const Text(
                            "Besin tüketimi hesaplamak için arama ekranına gidebilirsiniz.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  );
                }

                if (state is MealConsumptionFilterSuccess) {
                  return Expanded(
                    child: CalcTileWidget(
                      mealList: state.meal!.meals,
                    ),
                  );
                }

                return const SizedBox(
                  height: 0,
                  width: 0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
