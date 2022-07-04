import 'dart:async';

import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/core/utils/utils.dart';
import 'package:diyabet_app/features/meal/cubit/bolus_cubit.dart';
import 'package:diyabet_app/features/meal/widgets/time_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TargetType { fasting, satiety, overnight }

class BolusCalculationModal extends StatefulWidget {
  const BolusCalculationModal({Key? key, required this.totalCarbValue}) : super(key: key);
  final double totalCarbValue;
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
      child: BlocListener<BolusCubit, BolusState>(
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
                    child: Center(
                      child: Text("${state.resultValue} Ünite", style: Theme.of(bolusDialogContext!).textTheme.bodyLarge),
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: SizedBox(
            height: 435,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 10),
                Text("Toplam Karbonhidrat Değeri", style: Theme.of(context).textTheme.headline3),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Text('${widget.totalCarbValue} G.', style: Theme.of(context).textTheme.bodyMedium),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "En son yediğim yemek üzerinden geçen süre:",
                  style: Theme.of(context).textTheme.bolusScreenRed,
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
                                Text(state.ikoValue.toString(), style: Theme.of(context).textTheme.headline5),
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
                                Text(state.idfValue.toString(), style: Theme.of(context).textTheme.headline5),
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
                                Text(state.targetValue.toString(), style: Theme.of(context).textTheme.headline5),
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
                                Text(state.ikoValue.toString(), style: Theme.of(context).textTheme.headline5),
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
                                Text(state.idfValue.toString(), style: Theme.of(context).textTheme.headline5),
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
                                Text("160", style: Theme.of(context).textTheme.headline5),
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
                            Text(state.ikoValue.toString(), style: Theme.of(context).textTheme.headline5),
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
                          BlocProvider.of<BolusCubit>(context).calculateBolus(lastMealHour, widget.totalCarbValue);
                        } else {
                          BlocProvider.of<BolusCubit>(context).calculateBolus(
                            lastMealHour,
                            widget.totalCarbValue,
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
        ),
      ),
    );
  }
}
