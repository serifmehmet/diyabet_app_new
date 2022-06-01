import 'package:diyabet_app/features/calc_report/cubit/food_consumption_cubit.dart';
import 'package:diyabet_app/features/totals/cubit/totals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocBuilder<TotalsCubit, TotalsState>(
          builder: (context, state) {
            if (state is TotalsInitial) {
              if (state.foodCount == 0) {}
            }

            if (state is NoFoodState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text("Toplam Karbonhidrat", style: Theme.of(context).textTheme.genericHeader),
                  const SizedBox(height: 30),
                  const Text(
                    "0.0 Gr.",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: "Signika",
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: const Text(
                        "Henüz besin eklemediniz. Eklemek için arama ekranına gidebilirsiniz.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              );
            }

            if (state is GetFoodsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text("Toplam Karbonhidrat", style: Theme.of(context).textTheme.genericHeader),
                  const SizedBox(height: 30),
                  Text(
                    state.carbValue!.toStringAsFixed(1) + " G.",
                    style: const TextStyle(
                      color: Color(0xff000000),
                      fontFamily: "Signika",
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: state.foodCount > 0
                        ? TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                            ),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Uyarı"),
                                    content: const Text(
                                      "Eklediğiniz besinleri silmek üzeresiniz. Onaylıyor musunuz?",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, "Cancel"),
                                        child: const Text("İptal", style: TextStyle(color: Colors.red)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          BlocProvider.of<TotalsCubit>(context).deleteAllFoods();
                                          Navigator.pop(context, "OK");
                                        },
                                        child: const Text(
                                          "Onaylıyorum",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text("Hepsini Temizle", style: Theme.of(context).textTheme.overline),
                          )
                        : SizedBox(),
                  ),
                  Expanded(
                      child: FoodListWidget(
                    savedFoods: state.localSavedFoods,
                  )),
                  state.foodCount > 0
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<FoodConsumptionCubit>(context).saveConsumption(state.localSavedFoods);
                            },
                            child: const Text("Kaydet"),
                            style: ElevatedButton.styleFrom(elevation: 0),
                          ),
                        )
                      : SizedBox(),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
