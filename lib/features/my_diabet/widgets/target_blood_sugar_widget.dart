import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/features/my_diabet/cubit/user_blood_target_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TargetBloodSugarWidget extends StatefulWidget {
  const TargetBloodSugarWidget({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<TargetBloodSugarWidget> createState() => _TargetBloodSugarWidgetState();
}

class _TargetBloodSugarWidgetState extends State<TargetBloodSugarWidget> {
  FocusNode? fbstFocus;
  FocusNode? pbgtFocus;
  FocusNode? ofbgFocus;

  final TextEditingController fbstController = TextEditingController();
  final TextEditingController pbgtController = TextEditingController();
  final TextEditingController ofbgController = TextEditingController();

  @override
  void initState() {
    fbstFocus = FocusNode();
    pbgtFocus = FocusNode();
    ofbgFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    fbstFocus!.dispose();
    pbgtFocus!.dispose();
    ofbgFocus!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: BlocConsumer<UserBloodTargetCubit, UserBloodTargetState>(
        listener: (context, state) {
          if (state is UserBloodTargetSaved) {
            showDialog(
              context: context,
              builder: (builder) {
                return AlertDialog(
                  title: const Text("Başarılı"),
                  content: Text(
                    "Girdiğiniz bilgiler başarıyla kayıt edilmiştir.",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is UserBloodTargetLoaded) {
            fbstController.text = state.userBloodTarget.fbstValue.toString();
            pbgtController.text = state.userBloodTarget.pbgtValue.toString();
            ofbgController.text = state.userBloodTarget.ofbgtValue.toString();
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
                          focus.requestFocus(pbgtFocus);
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      Text("Tokluk Kan Şekeri Hedefi", style: Theme.of(context).textTheme.inputLabel),
                      const SizedBox(height: 9),
                      CarbAppTextInput(
                        inputText: "Tokluk kan şekeri değerini giriniz...",
                        inputTextStyle: Theme.of(context).textTheme.headline4,
                        inputBorderRadius: 15,
                        textController: pbgtController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        inputAction: TextInputAction.next,
                        focuNode: pbgtFocus,
                        onFieldSubmit: (val) {
                          pbgtFocus!.unfocus();
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
                          BlocProvider.of<UserBloodTargetCubit>(context).saveUBT(fbstController.text, pbgtController.text, ofbgController.text);
                        },
                        child: const Center(
                          child: Text("Kaydet"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
