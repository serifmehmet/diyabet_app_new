import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/domain/entities/local_consumption_item.dart';
import 'package:diyabet_app/domain/entities/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../features/totals/cubit/totals_cubit.dart';

class AddRecipeToConsumptionBottomSheetWidget extends StatefulWidget {
  const AddRecipeToConsumptionBottomSheetWidget({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  State<AddRecipeToConsumptionBottomSheetWidget> createState() => _AddRecipeToConsumptionBottomSheetWidgetState();
}

class _AddRecipeToConsumptionBottomSheetWidgetState extends State<AddRecipeToConsumptionBottomSheetWidget> {
  TextEditingController quantityController = TextEditingController();

  final FocusNode _quantityFocusNode = FocusNode();
  double? carbValue;

  @override
  void initState() {
    quantityController.text = "1";
    carbValue = widget.recipe.totalCarb!;
    super.initState();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      actions: [
        KeyboardActionsItem(
          focusNode: _quantityFocusNode,
          toolbarButtons: [
            (focusNode) {
              return GestureDetector(
                onTap: () => focusNode.unfocus(),
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Tamam",
                    style: TextStyle(
                      color: Color(0xff1BC47D),
                      fontSize: 16,
                      fontFamily: "Signika",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: KeyboardActions(
          config: _buildConfig(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantityController.text = "1";
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              gapH16,
              Padding(
                padding: context.paddingNormal,
                child: Column(
                  children: [
                    Text(
                      widget.recipe.name!,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    gapH12,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        color: Theme.of(context).colorScheme.copyWith(background: const Color(0xfff4f4f4)).background,
                      ),
                      child: Padding(
                        padding: context.paddingNormal,
                        child: Center(child: Text("${widget.recipe.portionQuantity} ${widget.recipe.recipeUnit!}")),
                      ),
                    ),
                    gapH12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: CarbAppTextInput(
                            focuNode: _quantityFocusNode,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            inputTextStyle: Theme.of(context).textTheme.headline4,
                            inputBorderRadius: 24,
                            inputText: "1",
                            textController: quantityController,
                            onChanged: (value) {
                              if (value != "") {
                                setState(() {
                                  carbValue = widget.recipe.totalCarb! * double.parse(value);
                                });
                              }
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Karbonhidrat", style: Theme.of(context).textTheme.headline5),
                            Text(
                              "${carbValue!.toStringAsFixed(2)} g",
                              style: const TextStyle(
                                color: Color(0xff0e150e),
                                fontSize: 30,
                                fontFamily: "Signika",
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    gapH16,
                    ElevatedButton(
                      onPressed: () {
                        LocalConsumptionItem localFood = LocalConsumptionItem(
                          Id: widget.recipe.id!,
                          CarbTotal: carbValue,
                          Name: widget.recipe.name,
                          Quantity: int.parse(quantityController.text),
                          UnitType: widget.recipe.recipeUnit,
                          Index: UniqueKey().hashCode,
                          UnitId: 0,
                          ConsumptionType: 2,
                        );

                        BlocProvider.of<TotalsCubit>(context).saveLocalFood(localFood);

                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text("Kaydet"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
