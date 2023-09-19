import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DiabetInfoView extends StatefulWidget {
  const DiabetInfoView({Key? key}) : super(key: key);

  @override
  State<DiabetInfoView> createState() => _DiabetInfoViewState();
}

class _DiabetInfoViewState extends State<DiabetInfoView> {
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
                flex: 10,
                child: PageView.builder(
                  itemCount: diabetInfoData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => DiabetInfoContent(
                    image: diabetInfoData[index].image,
                    title: diabetInfoData[index].title,
                    description: diabetInfoData[index].description,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    ...List.generate(
                      diabetInfoData.length,
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
                      height: _pageIndex < diabetInfoData.length - 1 ? 60 : 50,
                      width: _pageIndex < diabetInfoData.length - 1 ? 60 : 120,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageIndex == diabetInfoData.length - 1) {
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
                        style: _pageIndex < diabetInfoData.length - 1
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
                          child: _pageIndex < diabetInfoData.length - 1
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
                ),
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

class DiabetInfoItem {
  final String image, title, description;

  DiabetInfoItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<DiabetInfoItem> diabetInfoData = [
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation1.jpg",
    title: "Diyabet Bilgilerim Ekranı",
    description:
        "KarbApp karbonhidrat sayımı yöntemi kullanan diyabetliler için öğündeki bolus insülin dozunun hesaplanmasında yardımcı bir uygulamadır.",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation2.jpg",
    title: "Diyabet Bilgileri Girişi",
    description:
        "Takip edildiğiniz diyabet merkezinden size özel belirlenmiş olan İDF, İKO ve kan şekeri hedeflerinizi Diyabet Bilgilerim sekmesinden kaydetmeye başlayın.  ",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation3.jpg",
    title: "Diyabet Bilgileri Girişi",
    description: "İDF değerleri sekmesinden insülin düzeltme (duyarlılık) faktörünüzü kaydedin. ",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation3.jpg",
    title: "Diyabet Bilgileri Girişi",
    description:
        "Eğer gün içinde birden fazla İDF değeriniz varsa bunları saatlik dilimler halinde de kaydedebilirsiniz. Tek bir değer kullanıyorsanız herhangi bir saati seçerek değeri kaydetmeniz yeterlidir. ",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation4.jpg",
    title: "Diyabet Bilgileri Girişi",
    description: "İKO değerleri sekmesinden  insülin/karbonhidrat oranlarınızı tanımlayabilirsiniz. ",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation5.jpg",
    title: "Diyabet Bilgileri Girişi",
    description: "İKO değerleri sekmesinden  insülin/karbonhidrat oranlarınızı tanımlayabilirsiniz. ",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation6.jpg",
    title: "Diyabet Bilgileri Girişi",
    description: "İKO değerleri sekmesinden  insülin/karbonhidrat oranlarınızı tanımlayabilirsiniz. ",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation7.jpg",
    title: "Diyabet Bilgileri Girişi",
    description: "İKO değerleri sekmesinden  insülin/karbonhidrat oranlarınızı tanımlayabilirsiniz. ",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation8.jpg",
    title: "Diyabet Bilgileri Girişi",
    description: "İKO değerleri sekmesinden  insülin/karbonhidrat oranlarınızı tanımlayabilirsiniz. ",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation9.jpg",
    title: "Diyabet Bilgileri Girişi",
    description:
        "Birden fazla insülin/karbonhidrat oranı kullanıyorsanız saatlik dilimler halinde bilgilerinizi kaydedebilirsiniz.",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation10.jpg",
    title: "Diyabet Bilgileri Girişi",
    description:
        "Birden fazla insülin/karbonhidrat oranı kullanıyorsanız saatlik dilimler halinde bilgilerinizi kaydedebilirsiniz.",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation11.jpg",
    title: "Diyabet Bilgileri Girişi",
    description:
        "Birden fazla insülin/karbonhidrat oranı kullanıyorsanız saatlik dilimler halinde bilgilerinizi kaydedebilirsiniz.",
  ),
  DiabetInfoItem(
    image: "assets/diabet_info_img/diabetesInformation12.jpg",
    title: "Diyabet Bilgileri Girişi",
    description:
        "Son sekmeden kan şekeri hedeflerinizi tanımlayarak diyabet bilgilerimi tamamlamış olacaksınız. Gündüz ve gece için ayrı kan şekeri hedef değerleriniz olması muhtemeldir.",
  ),
];

class DiabetInfoContent extends StatelessWidget {
  const DiabetInfoContent({
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
        Expanded(
          flex: 7,
          child: Image.asset(
            image,
          ),
        ),
        gapH8,
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),

        Expanded(
          flex: 2,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
