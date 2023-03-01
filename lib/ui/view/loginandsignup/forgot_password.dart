import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../services/navigator.dart';
import '../base/page.dart';
import '../commonwidget/primary_elevated_button.dart';
class ForgotPassword extends AppPageWithAppBar {
  static String routeName = "/forgotPassword";
  final loginController = Get.put(LoginController());

  ForgotPassword({Key? key}) : super(key: key);
  static Future<bool?> start<bool>(bool loginWithMobile) {
    return navigateTo<bool>(routeName,
        arguments: {'loginWithMobile': loginWithMobile });
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
              phoneNumber,
              const SizedBox(
                height: 20,
              ),
              sendButton
            ],
          )),
    );
  }
  Widget get phoneNumber {
    return Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: TextField(
      textAlign: TextAlign.left,
      controller: loginController.getOtpMobileController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone_android),
        hintText: 'Enter mobile',
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
        child: PrimaryElevatedBtn("Get OTP",() =>loginController.getOtpButtonClick(arguments['loginWithMobile'] as bool),borderRadius:40.0 ),),);

  }

  Widget get companyLogo {
    return SizedBox(
      width: 152,
      height: 55,
      child: Image.asset("assets/png/logo.png"),
    );
  }
}
