import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/ui/view/commonwidget/primary_elevated_button.dart';

import '../../../controllers/helpcontroller.dart';
import '../../../services/navigator.dart';
import '../../../theme/my_theme.dart';
import '../base/page.dart';

class Help extends AppPageWithAppBar{
  static String routeName = "/help";
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName,
        currentPageTitle: "Help");
  }
  Help({Key? key}) : super(key: key);

  @override
  Widget get body{
    final controller = Get.put(HelpController());

    return Scaffold(
      backgroundColor: MyColors.kColorLightBC,
      body: Padding( padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
        child: SingleChildScrollView(
          child: Card(
            color: MyColors.kColorWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
             width: screenWidget,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  const SizedBox(height: 8,),
                  RichText(textAlign: TextAlign.center,
                    text: const TextSpan(
                        children: [
                      TextSpan(text: "Feedback\n",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold, fontFamily: '', color: Colors.black)),
                      TextSpan(text: "Send Your Feedback", style:TextStyle(fontSize: 12,fontFamily: 'Montserrat', color: Colors.black26)),
                    ]),),
                  const SizedBox(height: 8,),
                  textField(const Icon(Icons.supervised_user_circle_sharp),"Name*",controller.nameController,"text"),
                  const SizedBox(height: 24),  const SizedBox(height: 8,),
                  textField(const Icon(Icons.phone_android_sharp), "Mobile*",controller.mobileController,"text"),
                  const SizedBox(height: 24),
                  textField(const Icon(Icons.email),"Email*",controller.emailController,"text"),
                  const SizedBox(height: 24),
                  massageBox(controller.messageController,"text"),
                  const SizedBox(height: 24),
                  feedbackButton,
                  const SizedBox(height: 24),


                ],
              ),
            ),
          ),
      ),
        ),

    )
    );
  }
}
Widget  textField(Icon icons,String label,TextEditingController controller,String type){
  return Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
    Text(
      label,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    const SizedBox(height: 8),
    TextField(
      controller: controller,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon:icons ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: MyColors.kColorLightBC,
      ),
    )
  ],);

}

Widget  massageBox (TextEditingController controller,String type){
  return Form(
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration:  const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)) ,
        ),
        hintText: 'We shall look forward for your words of advice',
        hintStyle:TextStyle(fontSize: 14,),
        filled: true,
        fillColor: MyColors.kColorLightBC,
      ),
      maxLines: 5,
      maxLength: 200,
      textInputAction: TextInputAction.done,
      validator: (String? text) {
        if (text == null || text.isEmpty) {
          return 'Please enter a value';
        }
        return null;
      },
    ),
  );}
Widget get feedbackButton {
  final controller = Get.put(HelpController());
  return Padding(padding: const EdgeInsets.only(left: 0,right: 0),child: SizedBox(width: double.maxFinite,height:45,child: PrimaryElevatedBtn("Feedback",() =>controller.callHelpApi(),borderRadius:15.0 ),),);

}