import 'package:diyabet_app/features/my_diabet/models/time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';

class DiabetInfoWidget extends StatefulWidget {
  DiabetInfoWidget({Key? key, this.index}) : super(key: key);

  int? index;
  @override
  State<DiabetInfoWidget> createState() => _DiabetInfoWidgetState();
}

class _DiabetInfoWidgetState extends State<DiabetInfoWidget> {
  @override
  void initState() {
    print(widget.index.toString());
    super.initState();
  }

  var hourItems = TimeModels.create();
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              decoration: const BoxDecoration(
                  // color: Theme.of(context).colorScheme.copyWith(background: const Color(0xfff4f4f4)).background,
                  ),
              padding: const EdgeInsets.all(2),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text("Saat Seçiniz."),
                  isExpanded: true,
                  items: hourItems.timeModelList.map((e) {
                    return DropdownMenuItem(
                      value: e.hour,
                      child: Text(
                        e.hour!,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(
                      () {
                        dropDownValue = value!;
                      },
                    );
                  },
                  value: dropDownValue,
                ),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 50,
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.headline5,
                ),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.delete,
                  size: 18,
                ))
          ],
        );
      },
    );
  }
}
