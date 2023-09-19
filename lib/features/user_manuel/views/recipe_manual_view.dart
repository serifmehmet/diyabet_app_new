import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RecipeManualView extends StatefulWidget {
  const RecipeManualView({Key? key}) : super(key: key);

  @override
  State<RecipeManualView> createState() => _RecipeManualViewState();
}

class _RecipeManualViewState extends State<RecipeManualView> {
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
                  itemCount: recipeManualData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => RecipeManualContent(
                    image: recipeManualData[index].image,
                    title: recipeManualData[index].title,
                    description: recipeManualData[index].description,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    ...List.generate(
                      recipeManualData.length,
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
                      height: _pageIndex < recipeManualData.length - 1 ? 60 : 50,
                      width: _pageIndex < recipeManualData.length - 1 ? 60 : 120,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageIndex == recipeManualData.length - 1) {
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
                        style: _pageIndex < recipeManualData.length - 1
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
                          child: _pageIndex < recipeManualData.length - 1
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

class ReceipeManualItem {
  final String image, title, description;

  ReceipeManualItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<ReceipeManualItem> recipeManualData = [
  ReceipeManualItem(
    image: "assets/recipe_img/recipe1.jpg",
    title: "Tarif Oluşturma",
    description:
        "Tarif ekle butonuna tıklayarak kendi özgün tariflerinizi uygulamaya kaydedebilir ve dilediğiniz zaman besin tüketim kaydınıza ekleyebilirsiniz.",
  ),
  ReceipeManualItem(
    image: "assets/recipe_img/recipe2.jpg",
    title: "Karbonhidrat miktarını öğrenmek istediğiniz besinin adını yazarak aramaya başlayabilirsiniz. ",
    description:
        "Tarif eklerken besin veri tabanından tarifinizin içinde olan tüm malzemeleri ölçüleri ile seçerek giriniz. ",
  ),
  ReceipeManualItem(
    image: "assets/recipe_img/recipe3.jpg",
    title: "Tarif Oluşturma",
    description: "Tarifinizin kaç porsiyon ya da kase olduğunu seçerek ve ismini ekleyerek ilerleyin. ",
  ),
  ReceipeManualItem(
    image: "assets/recipe_img/recipe4.jpg",
    title: "Tarif Oluşturma",
    description: "Kaydet dediğinizde kendi tarifiniz tariflerim sekmesinde yerini alacaktır.",
  ),
];

class RecipeManualContent extends StatelessWidget {
  const RecipeManualContent({
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
