import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
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
                  itemCount: onBoardData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                    image: onBoardData[index].image,
                    title: onBoardData[index].title,
                    description: onBoardData[index].description,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    ...List.generate(
                      onBoardData.length,
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
                      height: _pageIndex < onBoardData.length - 1 ? 60 : 50,
                      width: _pageIndex < onBoardData.length - 1 ? 60 : 120,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageIndex == onBoardData.length - 1) {
                            NavigationService.instance.navigateToPageClear(
                              path: NavigationConstants.HOME_PAGE,
                            );
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                              curve: Curves.ease,
                            );
                          }
                        },
                        style: _pageIndex < onBoardData.length - 1
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
                          child: _pageIndex < onBoardData.length - 1
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

class OnboardItem {
  final String image, title, description;

  OnboardItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardItem> onBoardData = [
  OnboardItem(
    image: "assets/onboard/onboard1.jpg",
    title: "Uygulmanın tüm özelliklerini kullanabilmek için kayıt olmalısınız.",
    description:
        "Bu ekrandaki Kayıt Ol butonuna tıklayarak kayıtlı kullanıcı olabilir, Şifremi Unuttum butonuna tıklayarak şifrenizi yenileyebilirsiniz. Her ihtimale karşı Spam kutunuzu kontrol etmeyi unutmayın!",
  ),
  OnboardItem(
    image: "assets/onboard/onboard2.jpg",
    title: "Karbonhidrat miktarını öğrenmek istediğiniz besinin adını yazarak aramaya başlayabilirsiniz. ",
    description:
        "Karbonhidrat miktarını öğrenmek istediğiniz besinin adını yazıp, uygun gramaj değeri ya da veri tabanımızda tanımlanmış diğer ölçü birimlerini seçerek beslenme günlüğünüzü oluşturabilir, öğünde toplam alacağınız karbonhidrat miktarını hesaplayabilirsiniz. ",
  ),
  OnboardItem(
    image: "assets/onboard/onboard3.jpg",
    title: "Diyabet bilgilerinizi uygulamaya kaydetmeyi unutmayın. ",
    description:
        "İnsülin duyarlılık (düzeltme) faktörü, insülin/karbonhidrat oranları ve kan şekeri hedeflerinizi tanımlayabilirsiniz. Günün farklı zamanlarında değişebilen insülin duyarlılık (düzeltme) faktörü ve  insülin/karbonhidrat oranlarınıza göre birden fazla değeri saatlik dilimler halinde kaydedebilirsiniz.",
  ),
  OnboardItem(
    image: "assets/onboard/onboard4.jpg",
    title: "Tüketeceğiniz besinleri kaydedip bolus hesaplaması yapabilirsiniz.  ",
    description:
        "Tüketeceğiniz besinleri kaydettikten sonra bolus hesapla butonuna basarak, açlık kan şekerinize ve en son yediğiniz besin için yaptığınız insülin enjeksiyonunun üzerinden geçen zamana göre uygulamanın önereceği bolus insülin dozunu görebilirsiniz.",
  ),
  OnboardItem(
    image: "assets/onboard/onboard5.jpg",
    title: "Kendinize özel yemek tariflerini oluşturabilir, karbonhidrat miktarını hesaplayabilirsiniz. ",
    description:
        "Tarif ekle özelliği sayesinde kendi kullandığınız yemek tariflerini içindeki malzemeleri seçerek kaydedebilir, 1 porsiyon değerini hesaplayabilirsiniz. ",
  ),
  OnboardItem(
    image: "assets/onboard/onboard6.jpg",
    title: "Yardım Menüsü",
    description:
        "Uygulamanın kullanımıyla ilgili daha fazla yardım almak isterseniz yardım menüsünden daha detaylı bilgi alabilirsiniz ",
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ],
    );
  }
}
