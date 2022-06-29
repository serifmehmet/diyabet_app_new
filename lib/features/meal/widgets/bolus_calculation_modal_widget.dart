import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/features/meal/cubit/bolus_cubit.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Toplam Karbonhidrat Değeri", style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text('${widget.totalCarbValue} G.', style: Theme.of(context).textTheme.bodyMedium),
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: TargetType.fasting,
              groupValue: selectedTargetType,
              onChanged: (TargetType? value) {
                BlocProvider.of<BolusCubit>(context).changeTargetType(value!);
                setState(() {
                  selectedTargetType = value;
                });
              },
              title: Text(
                "Son 2 saat içerisinde yemek yemedim",
                style: Theme.of(context).textTheme.headline5,
              ),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
            ),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: TargetType.satiety,
              groupValue: selectedTargetType,
              onChanged: (TargetType? value) {
                BlocProvider.of<BolusCubit>(context).changeTargetType(value!);
                setState(() {
                  selectedTargetType = value;
                });
              },
              title: Text(
                "Son 2 saat içerisinde yemek yedim",
                style: Theme.of(context).textTheme.headline5,
              ),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
            ),
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: TargetType.overnight,
              groupValue: selectedTargetType,
              onChanged: (TargetType? value) {
                BlocProvider.of<BolusCubit>(context).changeTargetType(value!);
                setState(() {
                  selectedTargetType = value;
                });
              },
              title: Text(
                "Gece için hesaplama yapacağım",
                style: Theme.of(context).textTheme.headline5,
              ),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
            ),
            BlocBuilder<BolusCubit, BolusState>(
              builder: (context, state) {
                if (state is BolusInfoLoaded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "IDF Değeri:",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(state.idfValue.toString(), style: Theme.of(context).textTheme.headline5),
                    ],
                  );
                }

                return Container();
              },
            ),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<BolusCubit, BolusState>(
              builder: (context, state) {
                if (state is BolusInfoLoaded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "IKO Değeri:",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(state.ikoValue.toString(), style: Theme.of(context).textTheme.headline5),
                    ],
                  );
                }

                return Container();
              },
            ),
            const SizedBox(height: 5),
            BlocBuilder<BolusCubit, BolusState>(
              builder: (context, state) {
                if (state is BolusInfoLoaded) {
                  switch (state.targetType) {
                    case TargetType.fasting:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Açlık Hedef Kan Şekeri Değeri:",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(state.targetValue.toString(), style: Theme.of(context).textTheme.headline5),
                        ],
                      );

                    case TargetType.satiety:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tokluk Hedef Kan Şekeri Değeri:",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(state.targetValue.toString(), style: Theme.of(context).textTheme.headline5),
                        ],
                      );
                    case TargetType.overnight:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gece Açlık Hedef Kan Şekeri Değeri:",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(state.targetValue.toString(), style: Theme.of(context).textTheme.headline5),
                        ],
                      );
                    default:
                  }
                }
                return Container();
              },
            ),
            const Text("Anlık Kan Şekeri Değeri"),
            const SizedBox(height: 5),
            CarbAppTextInput(
              inputTextStyle: Theme.of(context).textTheme.headline5,
              inputBorderRadius: 10,
              inputText: "Kan şekeri değeri",
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Hesapla"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          ],
        ),
      ),
    );
  }
}
