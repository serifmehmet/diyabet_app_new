import 'package:diyabet_app/features/my_diabet/cubit/blood_target_cubit.dart';
import 'package:diyabet_app/features/my_diabet/widgets/target_blood_sugar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../../core/extensions/context_extensions.dart';
import '../cubit/iko_cubit.dart';
import '../cubit/my_diabet_cubit.dart';
import '../widgets/idf_time_range_dialog_widget.dart';
import '../widgets/iko_time_range_dialog_widget.dart';

class MyDiabetView extends StatefulWidget {
  const MyDiabetView({Key? key}) : super(key: key);

  @override
  State<MyDiabetView> createState() => _MyDiabetViewState();
}

class _MyDiabetViewState extends State<MyDiabetView> {
  void openIdfTimeRangeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: SizedBox(height: 251, child: IdfTimeRangeDialogWidget()),
        );
      },
    );
  }

  void openIkoTimeRangeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: SizedBox(height: 251, child: IkoTimeRangeDialogWidget()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              Tab(text: "Kan Şekeri Hedefleri")
            ],
            onTap: (tabIndex) {
              switch (tabIndex) {
                case 0:
                  BlocProvider.of<MyDiabetCubit>(context).getAllUserIdf();
                  break;
                case 1:
                  BlocProvider.of<IkoCubit>(context).getAllUserIko();
                  break;
                case 2:
                  BlocProvider.of<BloodTargetCubit>(context).getBloodTargetsOnUser();
                  break;
                default:
              }
            },
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: context.paddingMedium,
              child: SingleChildScrollView(
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
                        if (state is MyDiabetValueAdding) {
                          return const CircularProgressIndicator();
                        }
                        if (state is MyDiabetIdfListGetSuccess) {
                          return LimitedBox(
                            maxHeight: 550,
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                String formattedTime = DateFormat.Hm().format(state.userIdfList[index].hour!);
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "$formattedTime'dan itibaren",
                                      style: Theme.of(context).textTheme.headline5,
                                    ),
                                    Text(
                                      state.userIdfList[index].idfValue.toString(),
                                      style: Theme.of(context).textTheme.headline3,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (builder) {
                                              return AlertDialog(
                                                title: const Text("Uyarı"),
                                                content: const Text(
                                                  "Eklediğiniz değeri silmek üzeresiniz, onaylıyor musunuz?",
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context, "Cancel"),
                                                    child: const Text("İptal", style: TextStyle(color: Colors.red)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      BlocProvider.of<MyDiabetCubit>(context).deleteUserIdfItem(state.userIdfList[index].id!);
                                                      Navigator.pop(context, "OK");
                                                    },
                                                    child: const Text(
                                                      "Onaylıyorum",
                                                      style: TextStyle(color: Colors.black),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(IconlyBold.delete, size: 20))
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(height: 10, thickness: 1, color: Theme.of(context).primaryColor);
                              },
                              itemCount: state.userIdfList.length,
                              shrinkWrap: true,
                            ),
                          );
                        }

                        if (state is MyDiabetEmptyIdf) {
                          return Container();
                        }

                        return Container();
                      },
                    ),
                    BlocBuilder<MyDiabetCubit, MyDiabetState>(
                      builder: (context, state) {
                        if (state is MyDiabetIdfListGetSuccess) {
                          if (state.userIdfList.length < 8) {
                            return IconButton(
                              onPressed: () {
                                openIdfTimeRangeDialog();
                              },
                              icon: Icon(
                                IconlyBold.plus,
                                size: 36,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }

                        if (state is MyDiabetEmptyIdf) {
                          return IconButton(
                            onPressed: () {
                              openIdfTimeRangeDialog();
                            },
                            icon: Icon(
                              IconlyBold.plus,
                              size: 36,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          );
                        }

                        return Container();
                      },
                    )
                  ],
                ),
              ),
            ),
            //Tab 2
            Padding(
              padding: context.paddingMedium,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "İnsülin Karbonhidrat Oranı",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<IkoCubit, IkoState>(
                      builder: (context, state) {
                        if (state is IkoListGetSuccess) {
                          return LimitedBox(
                            maxHeight: 550,
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                String formattedTime = DateFormat.Hm().format(state.userIkoList[index].hour!);
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "$formattedTime'dan itibaren",
                                      style: Theme.of(context).textTheme.headline5,
                                    ),
                                    Text(
                                      state.userIkoList[index].ikoValue.toString(),
                                      style: Theme.of(context).textTheme.headline3,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (builder) {
                                              return AlertDialog(
                                                title: const Text("Uyarı"),
                                                content: const Text(
                                                  "Eklediğiniz değeri silmek üzeresiniz, onaylıyor musunuz?",
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context, "Cancel"),
                                                    child: const Text("İptal", style: TextStyle(color: Colors.red)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      BlocProvider.of<IkoCubit>(context).deleteSingleUserIko(state.userIkoList[index].id!);
                                                      Navigator.pop(context, "OK");
                                                    },
                                                    child: const Text(
                                                      "Onaylıyorum",
                                                      style: TextStyle(color: Colors.black),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(IconlyBold.delete, size: 20))
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(height: 10, thickness: 1, color: Theme.of(context).primaryColor);
                              },
                              itemCount: state.userIkoList.length,
                              shrinkWrap: true,
                            ),
                          );
                        }

                        if (state is EmptyIko) {
                          return Container();
                        }

                        return Container();
                      },
                    ),
                    BlocBuilder<IkoCubit, IkoState>(
                      builder: (context, state) {
                        if (state is IkoListGetSuccess) {
                          if (state.userIkoList.length < 8) {
                            return IconButton(
                              onPressed: () {
                                openIkoTimeRangeDialog();
                              },
                              icon: Icon(
                                IconlyBold.plus,
                                size: 36,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }

                        if (state is EmptyIko) {
                          return IconButton(
                            onPressed: () {
                              openIkoTimeRangeDialog();
                            },
                            icon: Icon(
                              IconlyBold.plus,
                              size: 36,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          );
                        }

                        return Container();
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: context.paddingNormal,
              child: const TargetBloodSugarWidget(),
            )
          ],
        ),
      ),
    );
  }
}
