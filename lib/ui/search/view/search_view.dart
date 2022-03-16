import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/input/carbapp_search_input.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_result_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

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
                context.read<SearchCubit>().getSearchItem(value);
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

                return const SizedBox();
              },
            ),
            const SizedBox(height: 60),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Tarif Ekle   +",
                style: Theme.of(context).textTheme.addRecipeText,
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

  Column searchInitial(BuildContext context) {
    return Column(
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
    );
  }

  Center searching() => const Center(child: CircularProgressIndicator());

  Expanded searchSuccess(BuildContext context, SearchSuccess state) {
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
              foodEntity: state.food,
            ),
          ),
        ],
      ),
    );
  }
}
