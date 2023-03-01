import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../services/navigator.dart';
import '../base/page.dart';
import '../commonwidget/primary_elevated_button.dart';
class SetPassword extends AppPageWithAppBar {
  static String routeName = "/setPassword";
  final loginController = Get.put(LoginController());
  SetPassword({Key? key}) : super(key: key);
  static Future<bool?> start<bool>(bool loginWithMobile,mobile) {
    return navigateOffAll<bool>(routeName,arguments: {'loginWithMobile': loginWithMobile ,'mobile': mobile});
  }
  @override
  double? get toolbarHeight => 0;
  @override
  Widget get body {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 56,
              ),
              companyLogo,
              const SizedBox(
                height: 56,
              ),
              newPassword,
              const SizedBox(
                height: 20,
              ),

              confirmPassword,
              const SizedBox(
                height: 20,
              ),
              sendButton
            ],
          )),
    );
  }
  Widget get oldPassword {
    return Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: TextField(
controller: loginController.getOldPasswordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      textAlign: TextAlign.left,

      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        hintText: 'Enter old password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            width: .10,
            color: Colors.grey,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: Colors.white,
      ),
    ),);
  }
  Widget get newPassword {
    return Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: TextField(
controller: loginController.getNewPasswordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      textAlign: TextAlign.left,

      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        hintText: 'Enter New password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            width: .10,
            color: Colors.grey,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: Colors.white,
      ),
    ),);
  }
  Widget get confirmPassword {
    return Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: TextField(
controller: loginController.getConfirmNewPasswordController,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      textAlign: TextAlign.left,

      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        hintText: 'Enter confirm password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            width: .10,
            color: Colors.grey,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: Colors.white,
      ),
    ),);
  }
  Widget get sendButton {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: SizedBox(
        width: screenWidget,
        height:45,
        child: PrimaryElevatedBtn("Update",() =>loginController.getForgetPasswordButtonClick( ),borderRadius:40.0 ),),);

  }
  Widget get companyLogo {
    return SizedBox(
      width: 152,
      height: 55,
      child: Image.asset("assets/png/logo.png"),
    );
  }
}
