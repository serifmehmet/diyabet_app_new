import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MainSubHeaderWidget extends StatelessWidget {
  const MainSubHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryVariant,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Karbonhidrat", style: Theme.of(context).textTheme.subtitle1),
                      Text("25 Gr.", style: Theme.of(context).textTheme.caption),
                    ],
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: context.width * 0.48,
                height: double.infinity,
                child: Padding(
                  padding: context.paddingNormal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Login button
                      Text("İnsülin", style: Theme.of(context).textTheme.subtitle1),

                      Text("4 Ünite", style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xffA3A0CA),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
