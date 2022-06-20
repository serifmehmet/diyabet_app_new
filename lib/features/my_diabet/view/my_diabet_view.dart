import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/features/my_diabet/cubit/my_diabet_cubit.dart';
import 'package:diyabet_app/features/my_diabet/models/time_model.dart';
import 'package:diyabet_app/features/my_diabet/widgets/time_range_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class MyDiabetView extends StatefulWidget {
  const MyDiabetView({Key? key}) : super(key: key);

  @override
  State<MyDiabetView> createState() => _MyDiabetViewState();
}

class _MyDiabetViewState extends State<MyDiabetView> {
  List<Widget> idfWidgetList = [];
  var hourItems = TimeModels.create();
  String? dropDownValue;

  void openTimeRangeDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: SizedBox(height: 250, child: TimeRangeDialogWidget()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          actionsIconTheme: const IconThemeData(color: Colors.black),
          iconTheme: const IconThemeData(color: Color(0xff000000)),
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.headline5,
            labelColor: Colors.black,
            tabs: const [
              Tab(
                text: "IDF Değerleri",
              ),
              Tab(text: "IKO Değerleri"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: context.paddingMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "İnsülin Duyarlılık Faktörü Değerleri",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<MyDiabetCubit, MyDiabetState>(
                    builder: (context, state) {
                      if (state is MyDiabetIdfListGetSuccess) {
                        return LimitedBox(
                          maxHeight: 550,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              String formattedTime = DateFormat.Hm().format(state.userIdfList[index].hour!);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$formattedTime'dan itibaren - ",
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    state.userIdfList[index].idfValue.toString(),
                                    style: Theme.of(context).textTheme.headline3,
                                  )
                                ],
                              );
                            },
                            itemCount: state.userIdfList.length,
                            shrinkWrap: true,
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                  // TextButton(
                  //   onPressed: openTimeRangeDialog,
                  //   child: Text(
                  //     "+",
                  //     style: Theme.of(context).textTheme.addRecipeText,
                  //   ),
                  // ),
                  IconButton(
                    onPressed: () {
                      final idfCount = context.read<MyDiabetCubit>().userIdfList!.length;
                      if (idfCount <= 7) {
                        openTimeRangeDialog();
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Uyarı"),
                              content: Center(
                                child: Text("8'den fazla değer ekleyemezsiniz."),
                              ),
                            );
                          },
                        );
                      }
                    },
                    icon: Icon(
                      IconlyBold.plus,
                      size: 36,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  // Container(
                  //   width: 150,
                  //   padding: const EdgeInsets.all(0),
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       padding: const EdgeInsets.all(0),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //     child: const Text("Kaydet", style: TextStyle(color: Colors.white)),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: context.paddingMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "İnsülin Karbonhidrat Oranı",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemBuilder: (context, index) {
                  //       return idfWidgetList[index];
                  //     },
                  //     itemCount: idfWidgetList.length,
                  //   ),
                  // ),
                  TextButton(
                    onPressed: openTimeRangeDialog,
                    child: const Text("IDF Satırı Ekle"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
