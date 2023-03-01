import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/loginandsignup/login_page.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../services/navigator.dart';
import '../base/page.dart';
import '../commonwidget/primary_elevated_button.dart';

class UserSignUp extends AppPageWithAppBar {
  static String routeName = "/UserSignUp";
  final loginController = Get.put(LoginController());

  UserSignUp({Key? key}) : super(key: key);

  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName);
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
              userName,
              const SizedBox(
                height: 20,
              ),
              email,
              const SizedBox(height: 20),
              phoneNumber,
              const SizedBox(
                height: 20,
              ),
              userPassword,
              const SizedBox(
                height: 20,
              ),
              confirmPassword,
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              signUpButton,
              const SizedBox(
                height: 20,
              ),
              signUp
            ],
          )),
    );
  }

  Widget get userName {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: loginController.getUserNameController,
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
          contentPadding:const EdgeInsets.all(16),
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget get email {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: loginController.getEmailController,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          hintText: 'Enter user email',
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
      ),
    );
  }

  Widget get phoneNumber {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: loginController.getMobileController,
        textAlign: TextAlign.left,
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
          contentPadding:const EdgeInsets.all(16),
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget get userPassword {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: loginController.getPasswordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          hintText: 'Enter your password',
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
      ),
    );
  }

  Widget get confirmPassword {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: loginController.getConfirmPasswordController,
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
          contentPadding: EdgeInsets.all(16),
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget get signUpButton {
    return Padding(
      padding:const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: screenWidget,
        height: 45,
        child: PrimaryElevatedBtn("Sign up", () => loginController.getSignUpButtonClick(),
            borderRadius: 40.0),
      ),
    );
  }

  Widget get signUp {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 20.0),
          children: <TextSpan>[
            const TextSpan(
                text: "Already have account? ",
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                    color: Colors.grey)),
            TextSpan(
                text: 'Login',
                style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                    color: MyColors.appColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    LogInScreen.start();
                  }),
          ],
        ),
      ),
    );
  }

  Widget get companyLogo {
    return SizedBox(
      width: 152,
      height: 55,
      child: Image.asset("assets/png/logo.png"),
    );
  }
}
