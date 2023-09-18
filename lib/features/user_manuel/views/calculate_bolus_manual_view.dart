import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CalculateBolusView extends StatefulWidget {
  const CalculateBolusView({Key? key}) : super(key: key);

  @override
  State<CalculateBolusView> createState() => _CalculateBolusViewState();
}

class _CalculateBolusViewState extends State<CalculateBolusView> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: calculateBolusData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => CalculateBolusContent(
                    image: calculateBolusData[index].image,
                    title: calculateBolusData[index].title,
                    description: calculateBolusData[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    calculateBolusData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: DotContainer(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
                  AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    height: _pageIndex < calculateBolusData.length - 1 ? 60 : 50,
                    width: _pageIndex < calculateBolusData.length - 1 ? 60 : 120,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex == calculateBolusData.length - 1) {
                          NavigationService.instance.pop();
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            curve: Curves.ease,
                          );
                        }
                      },
                      style: _pageIndex < calculateBolusData.length - 1
                          ? ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(
                                0,
                              ),
                              shape: const CircleBorder(),
                            )
                          : ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(
                                0,
                              ),
                            ),
                      child: Center(
                        child: _pageIndex < calculateBolusData.length - 1
                            ? const Icon(
                                IconlyLight.arrow_right,
                              )
                            : Text(
                                "Tanıtımı Bitir",
                                style: Theme.of(context).textTheme.elevatedButtonSmallText,
                              ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotContainer extends StatelessWidget {
  const DotContainer({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withOpacity(
                  0.4,
                ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class CalculateBolusItem {
  final String image, title, description;

  CalculateBolusItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<CalculateBolusItem> calculateBolusData = [
  CalculateBolusItem(
    image: "assets/calculate_bolus_info_img/calculateBolus1.jpg",
    title: "Bolus Hesaplama",
    description:
        "Bolus hesaplaması yapabilmek için »Diyabet Bilgilerim» sekmesindeki bilgilerin önceden kaydedilmiş olması gerekir. ",
  ),
  CalculateBolusItem(
    image: "assets/calculate_bolus_info_img/calculateBolus2.jpg",
    title: "Bolus Hesaplama",
    description:
        "Tüketeceğiniz besinleri seçerek günlüğünüze kaydettiğinizde bolus hesaplama sekmesine yönlendirileceksiniz. ",
  ),
  CalculateBolusItem(
    image: "assets/calculate_bolus_info_img/calculateBolus3.jpg",
    title: "Bolus Hesaplama",
    description:
        "Bolus hesaplaması yaparken en son yediğiniz yemeğin, bir başka deyişle en son yediğiniz yemek için yaptığınız bolus insülinin üzerinden kaç saat geçtiğini yeşil çubuğu oynatarak seçiniz. Ardından öğün öncesi kan şekeri değerinizi belirtilen yere yazınız. ",
  ),
  CalculateBolusItem(
    image: "assets/calculate_bolus_info_img/calculateBolus4.jpg",
    title: "Bolus Hesaplama",
    description: "Uygulama «Hesapla» dedikten sonra size öğün için uygulamanız gereken insülin dozunu önerecektir. ",
  ),
];

class CalculateBolusContent extends StatelessWidget {
  const CalculateBolusContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //const Spacer(),
        Image.asset(
          image,
          height: 350,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        gapH12,
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        gapH24
      ],
    );
  }
}
