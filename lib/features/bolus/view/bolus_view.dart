import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:flutter/material.dart';

class BolusView extends StatelessWidget {
  const BolusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Bolus Hesaplama",
                  style: Theme.of(context).textTheme.genericHeader,
                ),
              ),
              const SizedBox(height: 20),
              Text("Kan Şekeri", style: Theme.of(context).textTheme.inputLabel),
              const SizedBox(height: 9),
              CarbAppTextInput(
                inputTextStyle: Theme.of(context).textTheme.headline4,
                inputBorderRadius: 15,
              ),
              const SizedBox(height: 30),
              Text("Hedef Kan Şekeri", style: Theme.of(context).textTheme.inputLabel),
              const SizedBox(height: 9),
              CarbAppTextInput(
                inputTextStyle: Theme.of(context).textTheme.headline4,
                inputBorderRadius: 15,
              ),
              const SizedBox(height: 30),
              Text("İnsülin Duyarlılık Faktörü", style: Theme.of(context).textTheme.inputLabel),
              const SizedBox(height: 9),
              CarbAppTextInput(
                inputTextStyle: Theme.of(context).textTheme.headline4,
                inputBorderRadius: 15,
              ),
              const SizedBox(height: 30),
              Text("Karbonhidrat Miktarı", style: Theme.of(context).textTheme.inputLabel),
              const SizedBox(height: 9),
              CarbAppTextInput(
                inputTextStyle: Theme.of(context).textTheme.headline4,
                inputBorderRadius: 15,
              ),
              const SizedBox(height: 30),
              Text("İnsülin / Karbonhidrat Oranı", style: Theme.of(context).textTheme.inputLabel),
              const SizedBox(height: 9),
              CarbAppTextInput(
                inputTextStyle: Theme.of(context).textTheme.headline4,
                inputBorderRadius: 15,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Center(
                  child: Text("Hesapla"),
                ),
                style: ElevatedButton.styleFrom(elevation: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
