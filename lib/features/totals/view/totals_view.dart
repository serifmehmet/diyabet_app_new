import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/features/meal/cubit/meal_consumption_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/list/food_list_widget.dart';
import '../../home/cubit/bottom_nav_cubit.dart';
import '../cubit/totals_cubit.dart';
import 'models/total_items_model.dart';

class TotalsView extends StatelessWidget {
  const TotalsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: context.paddingNormal,
        child: BlocConsumer<TotalsCubit, TotalsState>(
          listener: (context, state) {
            if (state is FoodConsumptionSavingSuccess) {
              context.read<BottomNavCubit>().getConsumption();
              BlocProvider.of<MealConsumptionCubit>(context).getTodayMealList();
            }
          },
          builder: (context, TotalsState state) {
            if (state is TotalsInitial) {
              if (state.foodCount == 0) {}
            }

            if (state is FoodConsumptionSaving) {
              return const Center(child: CircularProgressIndicator());
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
                    "0.0 Gram",
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (!CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN)) ...[
                    Text(
                      "Üye değilseniz günlük besin tüketimlerinizi saklama özelliğini kullanamazsınız. ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.recipeListNotApproved,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            NavigationService.instance.navigateToPage(path: NavigationConstants.LOGIN);
                          },
                          child: const Text(
                            "Giriş Yap",
                            style: TextStyle(
                              color: Color(0xFFD6578A),
                              fontSize: 17,
                              fontFamily: "Signika",
                            ),
                          ),
                        ),
                        const Text("veya"),
                        TextButton(
                          onPressed: () {
                            NavigationService.instance.navigateToPage(path: NavigationConstants.REGISTER);
                          },
                          child: const Text(
                            "Kayıt Ol",
                            style: TextStyle(
                              color: Color(0xFFD6578A),
                              fontSize: 17,
                              fontFamily: "Signika",
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
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
                    "${state.carbValue!.toStringAsFixed(2)} Gram",
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
                                    title: const Text("Uyarı"),
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
                        : const SizedBox(),
                  ),
                  Expanded(
                      child: FoodListWidget(
                    savedFoods: state.localSavedFoods,
                    foodListType: FoodListType.totals,
                  )),
                  state.foodCount > 0 && CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN)
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<TotalsCubit>(context).saveConsumption(state.localSavedFoods);
                            },
                            style: ElevatedButton.styleFrom(elevation: 0),
                            child: const Text("Kaydet"),
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              "Üye değilseniz günlük besin tüketimlerinizi saklama özelliğini kullanamazsınız. ",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.recipeListNotApproved,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    NavigationService.instance.navigateToPage(path: NavigationConstants.LOGIN);
                                  },
                                  child: const Text(
                                    "Giriş Yap",
                                    style: TextStyle(
                                      color: Color(0xFFD6578A),
                                      fontSize: 17,
                                      fontFamily: "Signika",
                                    ),
                                  ),
                                ),
                                const Text("veya"),
                                TextButton(
                                  onPressed: () {
                                    NavigationService.instance.navigateToPage(path: NavigationConstants.REGISTER);
                                  },
                                  child: const Text(
                                    "Kayıt Ol",
                                    style: TextStyle(
                                      color: Color(0xFFD6578A),
                                      fontSize: 17,
                                      fontFamily: "Signika",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ],
              );
            }

            if (state is FoodConsumptionSavingSuccess) {}

            return const Center();
          },
        ),
      ),
    );
  }
}
