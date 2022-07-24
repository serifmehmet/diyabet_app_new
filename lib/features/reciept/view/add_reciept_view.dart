import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/input/carbapp_search_input.dart';
import '../../../core/theme_widgets/list/food_list_widget.dart';
import '../../totals/view/models/total_items_model.dart';
import '../cubit/reciept_cubit.dart';

class AddRecieptView extends StatelessWidget {
  AddRecieptView({Key? key}) : super(key: key);
  String? lastSearchedFood;
  var items = TotalsModel.create();

  @override
  Widget build(BuildContext context) {
    bool shouldPop = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xff000000),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: WillPopScope(
        onWillPop: () async => shouldPop,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      child: Text("Tarif Ekle", style: Theme.of(context).textTheme.genericHeader),
                    ),
                    const SizedBox(height: 15),
                    CarbAppSearchInput(
                      inputText: "Besin ara...",
                      inputTextStyle: Theme.of(context).textTheme.headline4,
                      inputIcon: IconlyLight.search,
                      iconSize: 16,
                      iconColor: Theme.of(context).colorScheme.secondaryContainer,
                      inputBorderRadius: 24,
                      onChanged: (value) {
                        if (value.isNotEmpty && lastSearchedFood != value) {
                          lastSearchedFood = value;
                          // BlocProvider.of<RecieptCubit>(context).searchFoodItemForReciept(value);
                        } else if (value.isEmpty) {
                          FocusManager.instance.primaryFocus!.unfocus();
                          BlocProvider.of<RecieptCubit>(context).clearFoodSeach();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocConsumer<RecieptCubit, RecieptState>(
                      builder: (context, state) {
                        if (state is RecieptInitial) {
                          return Flexible(flex: 2, child: recieptInitial(context));
                        }

                        if (state is RecieptSearch) {
                          return recieptSearch();
                        }

                        if (state is RecieptSearchSuccess) {
                          return recieptSearchSuccess(context, state);
                        }

                        if (state is RecieptSearchFailure) {
                          return recieptSearchFailure(context);
                        }

                        return const SizedBox();
                      },
                      listener: (context, state) {},
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Tarife Eklenen Besinler",
                      style: Theme.of(context).textTheme.genericHeader,
                    ),
                    FoodListWidget(),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Kaydet"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recieptSearchFailure(BuildContext context) {
    return Column(
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
    );
  }

  Widget recieptSearchSuccess(BuildContext context, RecieptSearchSuccess state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Arama Sonuçları",
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 32),
        // Flexible(
        //   child: SearchResultWidget(
        //     foodEntity: state,
        //   ),
        // ),
      ],
    );
  }

  Widget recieptSearch() => const Flexible(child: Center(child: CircularProgressIndicator()));

  Widget recieptInitial(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          IconlyBold.search,
          size: 36,
          color: Color(0xff000000),
        ),
        const SizedBox(height: 20),
        Text(
          "Tarif eklemek için önce yukarıdan besin aramalısınız.",
          style: Theme.of(context).textTheme.headline3,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
