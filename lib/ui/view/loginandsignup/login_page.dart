import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jump_q/controllers/login/login_controller.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/primary_elevated_button.dart';
import 'package:jump_q/ui/view/loginandsignup/forgot_password.dart';
import 'package:jump_q/ui/view/loginandsignup/sign_up.dart';

import '../../../services/navigator.dart';
import '../base/page.dart';

class LogInScreen extends AppPageWithAppBar {
  static String routeName = "/login";

  final loginController = Get.put(LoginController());

  static Future<bool?> start<bool>() {
    return navigateOffAll<bool>(routeName);
  }

  @override
  double? get toolbarHeight => 0;

  @override
  Widget get body {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenHeight / 3,
              width: screenWidget,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/app_logo.png'),
                  fit: BoxFit.fill,
                ),
                color: MyColors.backgroundLBlueColor,
              ),
              child: Text(""),
            ),
          ),
          Container(
            width: screenWidget,
            margin: EdgeInsets.only(top: screenHeight / 3),
            decoration:
                const BoxDecoration(color: MyColors.backgroundLBlueColor),
            child: Column(
              children: [
                userName,
                const SizedBox(
                  height: 20,
                ),
                userPassword,
                const SizedBox(
                  height: 20,
                ),
                forgotPassword,
                const SizedBox(
                  height: 20,
                ),
                loginButton,
                const SizedBox(
                  height: 20,
                ),
                loginWithMobileButton,
                const SizedBox(
                  height: 20,
                ),
                signUp
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get mobileField {
    return TextField(
      controller: loginController.passwordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        hintText: 'Enter user name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: Colors.white,
      ),
    );
  }

  Widget get userName {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: loginController.userNameController,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          hintText: 'Enter user name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              width: .10,
              color: Colors.grey,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget get userPassword {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: loginController.passwordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          hintText: 'Enter user password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              width: .10,
              color: Colors.grey,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget get forgotPassword {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 20.0),
        children: <TextSpan>[
          const TextSpan(
              text: 'Forgot you password?',
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15)),
          TextSpan(
              text: ' Reset here',
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  color: MyColors.appColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  ForgotPassword.start(false);
                }),
        ],
      ),
    );
  }

  Widget get loginButton {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: screenWidget,
        height: 45,
        child: PrimaryElevatedBtn(
            "Login", () => loginController.loginButtonClick(),
            borderRadius: 40.0),
      ),
    );
  }

  Widget get signUp {
    return InkWell(onTap: ()=>UserSignUp.start(),child: RichText(
      text: TextSpan(
        style: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 20.0),
        children: <TextSpan>[
          const TextSpan(
              text: "Don't have account? ",
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  color: Colors.grey)),
          TextSpan(
              text: 'Sign up',
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  color: MyColors.appColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  UserSignUp.start();
                }),
        ],
      ),
    ),);
  }

  Widget get loginWithMobileButton {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: screenWidget,
        height: 45,
        child: PrimaryElevatedBtn(
            "Login With Mobile", () => ForgotPassword.start(true),
            borderRadius: 40.0),
      ),
    );
  }

  Widget get companyLogo {
    return SizedBox(
      width: 152,
      height: 55,
      child: Image.asset("assets/images/intrologo.jpg"),
    );
  }
}
