import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
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
  double currentSliderValue = 30;
  @override
  void initState() {
    BlocProvider.of<BolusCubit>(context).listBolusInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
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
              // RadioListTile(
              //   contentPadding: EdgeInsets.zero,
              //   value: TargetType.fasting,
              //   groupValue: selectedTargetType,
              //   onChanged: (TargetType? value) {
              //     BlocProvider.of<BolusCubit>(context).changeTargetType(value!);
              //     setState(() {
              //       selectedTargetType = value;
              //     });
              //   },
              //   title: Text(
              //     "Son 2 saat içerisinde yemek yemedim",
              //     style: Theme.of(context).textTheme.headline5,
              //   ),
              //   visualDensity: const VisualDensity(
              //     horizontal: VisualDensity.minimumDensity,
              //     vertical: VisualDensity.minimumDensity,
              //   ),
              // ),
              // RadioListTile(
              //   contentPadding: EdgeInsets.zero,
              //   value: TargetType.satiety,
              //   groupValue: selectedTargetType,
              //   onChanged: (TargetType? value) {
              //     BlocProvider.of<BolusCubit>(context).changeTargetType(value!);
              //     setState(() {
              //       selectedTargetType = value;
              //     });
              //   },
              //   title: Text(
              //     "Son 2 saat içerisinde yemek yedim",
              //     style: Theme.of(context).textTheme.headline5,
              //   ),
              //   visualDensity: const VisualDensity(
              //     horizontal: VisualDensity.minimumDensity,
              //     vertical: VisualDensity.minimumDensity,
              //   ),
              // ),
              // RadioListTile(
              //   contentPadding: EdgeInsets.zero,
              //   value: TargetType.overnight,
              //   groupValue: selectedTargetType,
              //   onChanged: (TargetType? value) {
              //     BlocProvider.of<BolusCubit>(context).changeTargetType(value!);
              //     setState(() {
              //       selectedTargetType = value;
              //     });
              //   },
              //   title: Text(
              //     "Gece için hesaplama yapacağım",
              //     style: Theme.of(context).textTheme.headline5,
              //   ),
              //   visualDensity: const VisualDensity(
              //     horizontal: VisualDensity.minimumDensity,
              //     vertical: VisualDensity.minimumDensity,
              //   ),
              // ),
              Text(
                "En son yediğim yemek üzerinden geçen süre:",
                style: Theme.of(context).textTheme.bolusScreenRed,
              ),
              const SizedBox(height: 5),
              const TimeSliderWidget(),
              BlocBuilder<BolusCubit, BolusState>(
                builder: (context, state) {
                  if (state is BolusInfoLoaded) {
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
                    onPressed: () {},
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
    );
  }
}
