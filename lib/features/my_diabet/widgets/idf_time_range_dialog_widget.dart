import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/features/my_diabet/cubit/my_diabet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class IdfTimeRangeDialogWidget extends StatefulWidget {
  const IdfTimeRangeDialogWidget({Key? key}) : super(key: key);

  @override
  State<IdfTimeRangeDialogWidget> createState() => _IdfTimeRangeDialogWidgetState();
}

class _IdfTimeRangeDialogWidgetState extends State<IdfTimeRangeDialogWidget> {
  var selectedTime;
  TextEditingController idfValueController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<MyDiabetCubit, MyDiabetState>(
      listener: (context, state) {
        if (state is MyDiabetValueAddedFailure) {
          showDialog(
            context: context,
            builder: (builder) {
              return AlertDialog(
                title: const Text("Uyarı"),
                content: Text(
                  state.failureMessage,
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            },
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  showCustomTimePicker(
                      context: context,

                      // It is a must if you provide selectableTimePredicate
                      onFailValidation: (context) => print('Unavailable selection'),
                      initialTime: const TimeOfDay(hour: 0, minute: 00),
                      selectableTimePredicate: (time) => time!.minute % 30 == 0).then((time) => setState(
                        () {
                          selectedTime = time!.format(context);
                        },
                      ));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffF4F4F4),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(IconlyLight.time_circle),
                      const SizedBox(width: 5),
                      selectedTime != null
                          ? Text(
                              "Seçilen saat: $selectedTime'dan itibaren",
                              style: Theme.of(context).textTheme.headline6,
                            )
                          : Text(
                              "Saat seçmek için dokunun. ",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                    ],
                  )),
                )),

            // selectedTime != null
            //     ? Text(
            //         "Seçilen saat: 'dan itibaren",
            //         style: Theme.of(context).textTheme.headline5,
            //       )
            //     : Text(
            //         "Seçilen saat: ",
            //         style: Theme.of(context).textTheme.headline5,
            //       ),
            const SizedBox(
              height: 20,
            ),
            CarbAppTextInput(
              inputText: "IDF Değerini giriniz.",
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              inputIcon: IconlyLight.edit,
              iconSize: 24,
              iconColor: const Color(0xff130F26),
              inputTextStyle: Theme.of(context).textTheme.headline4,
              inputBorderRadius: 15,
              textController: idfValueController,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Değer boş bırakılamaz';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedTime == null) {
                    showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(content: Text("Saat seçmelisiniz.", style: Theme.of(context).textTheme.headline5));
                      },
                    );
                  }
                  if (formKey.currentState!.validate()) {
                    TimeOfDay startTime = TimeOfDay(hour: int.parse(selectedTime.split(":")[0]), minute: int.parse(selectedTime.split(":")[1]));
                    final isAdded = BlocProvider.of<MyDiabetCubit>(context).addIdfValueAndTime(startTime, idfValueController.text);
                    if (isAdded) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text(
                  "Kaydet",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
