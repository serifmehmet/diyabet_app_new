import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/input/carbapp_search_input.dart';
import '../../../domain/entities/cache_food_list_item.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_result_widget.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  String? lastSearchFood;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CarbAppSearchInput(
                  inputText: "Besin ara...",
                  inputIcon: IconlyLight.search,
                  iconSize: 16,
                  iconColor: Theme.of(context).colorScheme.secondaryContainer,
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 24,
                  onChanged: (value) {
                    if (value.isNotEmpty && lastSearchFood != value) {
                      lastSearchFood = value;
                      context.read<SearchCubit>().getSearchItem(value);
                    } else if (value.isEmpty) {
                      FocusManager.instance.primaryFocus!.unfocus();
                      context.read<SearchCubit>().clearSearch();
                    }
                  },
                ),
                const SizedBox(
                  height: 46,
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case SearchStatus.initial:
                        return searchInitial(context);
                      case SearchStatus.loading:
                        return searching();
                      case SearchStatus.failure:
                        return searchFailure(context);
                      case SearchStatus.success:
                        return searchSuccess(context, state.foodList);
                      default:
                        return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 20),
                if (CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN)) ...[
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        "Tarif Ekle   +",
                        style: Theme.of(context).textTheme.addRecipeText,
                      ),
                      onPressed: () {
                        NavigationService.instance.navigateToPage(path: NavigationConstants.ADD_RECIEPT);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
                const Divider(
                  height: 1,
                  color: Color(0xffF5F5F5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchFailure(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            IconlyBold.danger,
            color: Color(0xFF000000),
            size: 50,
          ),
          const SizedBox(
            height: 18,
          ),
          Text("Sonuç Bulunamadı", style: Theme.of(context).textTheme.searchNotFound),
          Text(
            "Baska bir kelime ile arayabilir ya da kendi tarinizi ekleyebilirsiniz.",
            style: Theme.of(context).textTheme.searchNotFoundLight,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget searchInitial(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            IconlyBold.search,
            size: 36,
            color: Color(0xff000000),
          ),
          const SizedBox(height: 20),
          Text(
            "Aramak istediğiniz besin adını yukarıya yazın.",
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget searching() {
    return const Expanded(child: Center(child: CircularProgressIndicator()));
  }

  Widget searchSuccess(BuildContext context, List<CacheFoodListItem> foodList) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Arama Sonuçları - (${foodList.length} adet)",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SearchResultWidget(
              foodEntity: foodList,
            ),
          ),
        ],
      ),
    );
  }
}
