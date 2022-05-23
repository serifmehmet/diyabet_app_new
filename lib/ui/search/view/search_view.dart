import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/input/carbapp_search_input.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_result_widget.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  String? lastSearchFood;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarbAppSearchInput(
              inputText: "Gıda ara...",
              inputIcon: IconlyLight.search,
              iconSize: 16,
              iconColor: Theme.of(context).colorScheme.secondaryVariant,
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
            BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SearchInitial) {
                  return searchInitial(context);
                }

                if (state is Searching) {
                  return searching();
                }

                if (state is SearchSuccess) {
                  return searchSuccess(context, state);
                }

                if (state is SearchFailure) {
                  return searchFailure(context);
                }

                return const SizedBox();
              },
            ),
            const SizedBox(height: 60),
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
            const Divider(
              height: 1,
              color: Color(0xffF5F5F5),
            ),
          ],
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
            "Aramak istediğiniz gıda adını yukarıya yazın.",
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

  Widget searchSuccess(BuildContext context, SearchSuccess state) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Arama Sonuçları",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SearchResultWidget(
              foodEntity: state.cacheFoodListItem,
            ),
          ),
        ],
      ),
    );
  }
}
