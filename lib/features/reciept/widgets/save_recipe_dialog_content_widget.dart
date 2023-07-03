import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/button/app_button.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/features/reciept/cubit/recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class SaveRecipeDialogContent extends StatefulWidget {
  const SaveRecipeDialogContent({Key? key}) : super(key: key);

  @override
  State<SaveRecipeDialogContent> createState() => _SaveRecipeDialogContentState();
}

class _SaveRecipeDialogContentState extends State<SaveRecipeDialogContent> {
  final _quantityController = TextEditingController();
  final _node = FocusScopeNode();
  final _recipeNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String get quantity => _quantityController.text;
  String get recipeName => _recipeNameController.text;

  String? dropDownValue;

  @override
  void dispose() {
    _node.dispose();
    // _quantityController.dispose();
    // _quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<RecipeCubit>(context).getRecipeUnits();
    super.initState();
  }

  bool isChecked = false;
  double totalCarb = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: true,
      child: SizedBox(
        height: 480,
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH16,
                Text(
                  "Porsiyon tipi",
                  style: Theme.of(context).textTheme.inputLabel,
                ),
                gapH4,
                BlocBuilder<RecipeCubit, RecipeState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                      recipeUnitListLoaded: (recipeUnits) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: const Text("Birim Seçiniz"),
                            isExpanded: true,
                            icon: const Icon(
                              IconlyLight.arrow_down_circle,
                              color: Colors.black,
                              size: 24,
                            ),
                            items: recipeUnits.map((item) {
                              return DropdownMenuItem(
                                value: item.description,
                                child: Text(
                                  item.description!,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                dropDownValue = value!;
                              });
                            },
                            value: dropDownValue,
                          ),
                        );
                      },
                    );
                  },
                ),
                gapH12,
                Text(
                  "Porsiyon adedi",
                  style: Theme.of(context).textTheme.inputLabel,
                ),
                gapH4,
                CarbAppTextInput(
                  textController: _quantityController,
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  inputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Tarif porsiyonu boş bırakılamaz.";
                    }
                    if (val == "0") {
                      return "Porsiyon miktarı 0'dan büyük olmalıdır.";
                    }
                    return null;
                  },
                ),
                gapH12,
                Text("Tarif Adı", style: Theme.of(context).textTheme.inputLabel),
                gapH4,
                CarbAppTextInput(
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                  textController: _recipeNameController,
                  inputAction: TextInputAction.done,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Tarif adı boş bırakılamaz.";
                    }
                    return null;
                  },
                ),
                gapH12,
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) => setState(() {
                        isChecked = value!;
                      }),
                    ),
                    const Text(
                      "Tarifimi onaylama sistemine gönder?",
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    textOfButton: "Tarifi Kaydet",
                    textColorOfButton: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<RecipeCubit>(context).saveRemoteRecipe(
                          recipeName: recipeName,
                          portionQuantity: int.parse(quantity),
                          recipeUnit: dropDownValue!,
                        );
                        Navigator.of(context).pop(false);
                      }
                    },
                  ),
                ),
                gapH8,
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    textOfButton: "İptal et",
                    textColorOfButton: Colors.white,
                    buttonBackgroundColor: const Color(0xffff0000),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
