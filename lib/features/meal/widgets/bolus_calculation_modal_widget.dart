import 'dart:async';

import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/core/utils/utils.dart';
import 'package:diyabet_app/features/meal/cubit/bolus_cubit.dart';
import 'package:diyabet_app/features/meal/widgets/time_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

enum TargetType { fasting, satiety, overnight }

class BolusCalculationModal extends StatefulWidget {
  const BolusCalculationModal({Key? key, required this.totalCarbValue, required this.mealId}) : super(key: key);
  final double totalCarbValue;
  final int mealId;
  @override
  State<BolusCalculationModal> createState() => _BolusCalculationModalState();
}

class _BolusCalculationModalState extends State<BolusCalculationModal> {
  TargetType? selectedTargetType = TargetType.fasting;
  TextEditingController instantBloodSugar = TextEditingController();
  double currentSliderValue = 30;
  int lastMealHour = 0;
  BuildContext? bolusDialogContext;
  @override
  void initState() {
    BlocProvider.of<BolusCubit>(context).listBolusInfo();
    super.initState();
  }

  showResultModal() async {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: BlocConsumer<BolusCubit, BolusState>(
        listener: (context, state) {
          if (state is BolusCalculated) {
            bolusDialogContext = context;

            showGeneralDialog(
              context: bolusDialogContext!,
              barrierDismissible: false,
              transitionBuilder: (ctx, animation, secondaryAnimation, child) {
                return Utils.animateDialogGrow(animation, secondaryAnimation, child);
              },
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (animation, secondaryAnimation, child) {
                return AlertDialog(
                  content: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Text("Hesaplamanız başarıyla kaydedilmiştir.", style: Theme.of(context).textTheme.bodyLarge),
                        Text("${state.resultValue.toStringAsFixed(2)} Ünite", style: Theme.of(bolusDialogContext!).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                );
              },
            );

            Timer(
              const Duration(seconds: 2),
              () {
                Navigator.pop(bolusDialogContext!);
                Navigator.pop(context);
              },
            );
          }
        },
        builder: (context, state) {
          if (state is UserIdfListEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconlyBold.danger,
                  size: 100,
                  color: Theme.of(context).errorColor,
                ),
                Text(
                  "Diyabet bilgileriniz eksik olduğu için Bolus Hesaplama modülü kullanılamıyor.",
                  style: Theme.of(context).textTheme.bolusScreenUserValues,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                  onPressed: () {
                    Navigator.pop(context);
                    NavigationService.instance.navigateToPage(path: NavigationConstants.MY_DIABET);
                  },
                  child: Text(
                    "Diyabet Bilgileri",
                    style: Theme.of(context).textTheme.recipeListButtonText,
                  ),
                ),
              ],
            );
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: SizedBox(
              height: 470,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Toplam Karbonhidrat Değeri", style: Theme.of(context).textTheme.headline3),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Text('${widget.totalCarbValue} g', style: Theme.of(context).textTheme.bolusScreenHeaderRed),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "En son yediğim yemek üzerinden geçen süre:",
                    style: Theme.of(context).textTheme.bolusScreenGreen,
                  ),
                  const SizedBox(height: 5),
                  const TimeSliderWidget(),
                  BlocBuilder<BolusCubit, BolusState>(
                    builder: (context, state) {
                      if (state is BolusInfoLoaded) {
                        lastMealHour = state.lastMealHour;
                        if (state.lastMealHour == 5) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "K/I Oranı:",
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(state.ikoValue.toString(), style: Theme.of(context).textTheme.bolusScreenUserValues),
                                ],
                              ),
                              const Divider(thickness: 1, color: Colors.grey),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "IDF:",
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(state.idfValue.toString(), style: Theme.of(context).textTheme.bolusScreenUserValues),
                                ],
                              ),
                              const Divider(thickness: 1, color: Colors.grey),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Açlık Hedef Kan Şekeri Değeri:",
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(state.targetValue.toString(), style: Theme.of(context).textTheme.bolusScreenUserValues),
                                ],
                              ),
                            ],
                          );
                        } else if (state.lastMealHour == 4 || state.lastMealHour == 3) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "K/I Oranı:",
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(state.ikoValue.toString(), style: Theme.of(context).textTheme.bolusScreenUserValues),
                                ],
                              ),
                              const Divider(thickness: 1, color: Colors.grey),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "IDF:",
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(state.idfValue.toString(), style: Theme.of(context).textTheme.bolusScreenUserValues),
                                ],
                              ),
                              const Divider(thickness: 1, color: Colors.grey),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hedef Kan Şekeri Değeri:",
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  Text("160", style: Theme.of(context).textTheme.bolusScreenUserValues),
                                ],
                              ),
                            ],
                          );
                        }
                        return Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "K/I Oranı:",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(state.ikoValue.toString(), style: Theme.of(context).textTheme.bolusScreenUserValues),
                            ],
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(height: 5),
                  const Text("Anlık Kan Şekeri Değeri"),
                  const SizedBox(height: 5),
                  BlocBuilder<BolusCubit, BolusState>(
                    builder: (context, state) {
                      if (state is BolusInfoLoaded) {
                        if (state.lastMealHour == 5 || (state.lastMealHour == 3 || state.lastMealHour == 4)) {
                          return CarbAppTextInput(
                            inputTextStyle: Theme.of(context).textTheme.headline5,
                            inputBorderRadius: 10,
                            inputText: "Kan şekeri değeri",
                            textController: instantBloodSugar,
                          );
                        }
                      }

                      return const SizedBox(height: 0);
                    },
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (lastMealHour < 3) {
                            BlocProvider.of<BolusCubit>(context).calculateBolus(lastMealHour, widget.totalCarbValue, widget.mealId);
                          } else {
                            BlocProvider.of<BolusCubit>(context).calculateBolus(
                              lastMealHour,
                              widget.totalCarbValue,
                              widget.mealId,
                              instantBloodSugarValue: double.parse(instantBloodSugar.text),
                            );
                          }
                        },
                        child: const Text("Hesapla"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
