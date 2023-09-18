import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchFoodManualView extends StatefulWidget {
  const SearchFoodManualView({Key? key}) : super(key: key);

  @override
  State<SearchFoodManualView> createState() => _SearchFoodManualViewState();
}

class _SearchFoodManualViewState extends State<SearchFoodManualView> {
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
                  itemCount: searchFoodManualData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => SearchFoodManualContent(
                    image: searchFoodManualData[index].image,
                    title: searchFoodManualData[index].title,
                    description: searchFoodManualData[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    searchFoodManualData.length,
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
                    height: _pageIndex < searchFoodManualData.length - 1 ? 60 : 50,
                    width: _pageIndex < searchFoodManualData.length - 1 ? 60 : 120,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex == searchFoodManualData.length - 1) {
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
                      style: _pageIndex < searchFoodManualData.length - 1
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
                        child: _pageIndex < searchFoodManualData.length - 1
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

class SearchFoodManualItem {
  final String image, title, description;

  SearchFoodManualItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<SearchFoodManualItem> searchFoodManualData = [
  SearchFoodManualItem(
    image: "assets/search_food_img/searchFoodManual1.jpg",
    title: "Besin Arama",
    description:
        "Besin arama sekmesinde istediğiniz besinin adını yazarak besin tüketim kaydınızı oluşturmaya başlayın.  ",
  ),
  SearchFoodManualItem(
    image: "assets/search_food_img/searchFoodManual2.jpg",
    title: "Besin Seçimi",
    description: "Aramada önünüze çıkan besinlerden size en uygun olanını seçerek ilerleyin. ",
  ),
  SearchFoodManualItem(
    image: "assets/search_food_img/searchFoodManual3.jpg",
    title: "Birim ve Miktar Seçimi",
    description: "Seçtiğiniz besinin birimini seçerek uygun miktarı belirleyin. ",
  ),
  SearchFoodManualItem(
    image: "assets/search_food_img/searchFoodManual4.jpg",
    title: "Birim ve Miktar Seçimi",
    description: "Seçtiğiniz besinin birimini seçerek uygun miktarı belirleyin. ",
  ),
  SearchFoodManualItem(
    image: "assets/search_food_img/searchFoodManual5.jpg",
    title: "Birim ve Miktar Seçimi",
    description: "Seçtiğiniz besinin birimini seçerek uygun miktarı belirleyin. ",
  ),
  SearchFoodManualItem(
    image: "assets/search_food_img/searchFoodManual6.jpg",
    title: "Besin Seçimleriniz",
    description: "Öğün için eklediğiniz her besini görebilir, gerektiğinde değişiklik sağlayabilirsiniz. ",
  ),
  SearchFoodManualItem(
    image: "assets/search_food_img/searchFoodManual7.jpg",
    title: "Besin Tüketim Kayıtları",
    description: "Kaydettiğiniz her besin ise besin tüketim kayıtları sekmesinde gözükecektir.  ",
  ),
];

class SearchFoodManualContent extends StatelessWidget {
  const SearchFoodManualContent({
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
