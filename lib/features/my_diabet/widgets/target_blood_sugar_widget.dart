import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/input/carbapp_text_input.dart';
import '../cubit/blood_target_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class TargetBloodSugarWidget extends StatefulWidget {
  const TargetBloodSugarWidget({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<TargetBloodSugarWidget> createState() => _TargetBloodSugarWidgetState();
}

class _TargetBloodSugarWidgetState extends State<TargetBloodSugarWidget> {
  FocusNode? fbstFocus;

  FocusNode? ofbgFocus;

  final TextEditingController fbstController = TextEditingController();

  final TextEditingController ofbgController = TextEditingController();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      actions: [
        KeyboardActionsItem(focusNode: fbstFocus!, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
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
        ]),
        KeyboardActionsItem(focusNode: ofbgFocus!, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
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
        ])
      ],
    );
  }

  @override
  void initState() {
    fbstFocus = FocusNode();

    ofbgFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    fbstFocus!.dispose();

    ofbgFocus!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return KeyboardActions(
      config: _buildConfig(context),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: BlocConsumer<BloodTargetCubit, BloodTargetState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (successMessage, userBloodTarget) {
                fbstController.text = userBloodTarget.fbstValue.toString();
                ofbgController.text = userBloodTarget.ofbgtValue.toString();
                showDialog(
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      title: const Text("Başarılı"),
                      content: Text(
                        successMessage,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  },
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              loading: (value) => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (value) {
                fbstController.text = value.userBloodTarget.fbstValue.toString();
                ofbgController.text = value.userBloodTarget.ofbgtValue.toString();
                return Column(
                  children: [
                    const Text("Hedef Kan Şekeri Değerleri"),
                    const SizedBox(height: 30),
                    Form(
                      key: TargetBloodSugarWidget.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Açlık Kan Şekeri Hedefi", style: Theme.of(context).textTheme.inputLabel),
                          const SizedBox(height: 9),
                          CarbAppTextInput(
                            inputText: "Açlık kan şekeri değerini giriniz...",
                            inputTextStyle: Theme.of(context).textTheme.headline4,
                            inputBorderRadius: 15,
                            textController: fbstController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            inputAction: TextInputAction.next,
                            focuNode: fbstFocus,
                            onFieldSubmit: (val) {
                              fbstFocus!.unfocus();
                              focus.requestFocus(ofbgFocus);
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          Text("Gece Açlık Kan Şekeri Hedefi", style: Theme.of(context).textTheme.inputLabel),
                          const SizedBox(height: 9),
                          CarbAppTextInput(
                            inputText: "Gece açlık kan şekeri değerini giriniz...",
                            inputTextStyle: Theme.of(context).textTheme.headline4,
                            inputBorderRadius: 15,
                            textController: ofbgController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            inputAction: TextInputAction.done,
                            focuNode: ofbgFocus,
                            onFieldSubmit: (val) {
                              ofbgFocus!.unfocus();
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (value.userBloodTarget.fbstValue == null) {
                                BlocProvider.of<BloodTargetCubit>(context).saveUserBloodTarget(fbstController.text, ofbgController.text);
                              } else {
                                BlocProvider.of<BloodTargetCubit>(context).updateBloodTarget(
                                  fbstController.text,
                                  ofbgController.text,
                                  value.userBloodTarget.id,
                                );
                              }
                            },
                            child: Center(
                              child: value.userBloodTarget.fbstValue == null ? const Text("Kaydet") : const Text("Güncelle"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              orElse: () {
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
