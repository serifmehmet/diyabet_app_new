import 'package:diyabet_app/core/utils/utils.dart';
import 'package:diyabet_app/features/meal/cubit/bolus_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSliderWidget extends StatefulWidget {
  const TimeSliderWidget({Key? key}) : super(key: key);

  @override
  State<TimeSliderWidget> createState() => _TimeSliderWidgetState();
}

class _TimeSliderWidgetState extends State<TimeSliderWidget> {
  int indexTop = 5;
  double valueBottom = 3;
  @override
  Widget build(BuildContext context) => SliderTheme(
        data: const SliderThemeData(activeTickMarkColor: Colors.transparent, inactiveTickMarkColor: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildSliderTopLabel()],
        ),
      );

  Widget buildSliderTopLabel() {
    final labels = ['30dk', '1', '1.5', '2', '2.5', '3+'];
    const double min = 0;
    final double max = labels.length - 1;
    final divisions = labels.length - 1;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, label) {
                const selectedColor = Colors.black;
                final unselectedColor = Colors.black.withOpacity(0.3);
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(label: label.toString(), color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
          value: indexTop.toDouble(),
          min: min,
          max: max,
          divisions: divisions,
          onChanged: (value) {
            setState(() {
              indexTop = value.toInt();
            });
            BlocProvider.of<BolusCubit>(context).changeTargetType(indexTop);
          },
        )
      ],
    );
  }

  Widget buildLabel({required String label, required double width, required Color color}) => SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400).copyWith(color: color),
        ),
      );
}
