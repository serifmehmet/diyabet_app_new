import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_search_input.dart';
import 'package:diyabet_app/ui/reciept/cubit/reciept_cubit.dart';
import 'package:diyabet_app/ui/search/widgets/search_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class AddRecieptView extends StatelessWidget {
  const AddRecieptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                child: Text("Tarif Ekle", style: Theme.of(context).textTheme.genericHeader),
              ),
              const SizedBox(height: 15),
              CarbAppSearchInput(
                inputText: "Gıda ara...",
                inputIcon: IconlyLight.search,
                iconSize: 16,
                iconColor: Theme.of(context).colorScheme.secondaryVariant,
                inputBorderRadius: 24,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    BlocProvider.of<RecieptCubit>(context).searchFoodItemForReciept(value);
                  } else {
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
                            "Tarif eklemek için önce yukarıdan gıda aramalısınız.",
                            style: Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is RecieptSearch) {
                    return const Expanded(child: Center(child: CircularProgressIndicator()));
                  }

                  if (state is RecieptSearchSuccess) {
                    return Expanded(
                      child: Column(
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

                  if (state is RecieptSearchFailure) {
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

                  return const SizedBox();
                },
                listener: (context, state) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
