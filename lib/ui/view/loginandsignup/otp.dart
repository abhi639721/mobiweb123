import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/base/page.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../services/navigator.dart';
import '../commonwidget/primary_elevated_button.dart';

class Otp extends AppPageWithAppBar {
  static String routeName = "/otp";
  String otpCode = "";
  final loginController = Get.put(LoginController());

  Otp({Key? key}) : super(key: key);

  static Future<bool?> start<bool>(bool loginWithMobile, String mobile) {
    return navigateTo<bool>(routeName,
        arguments: {'loginWithMobile': loginWithMobile, 'mobile': mobile});
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
              otpTextField,
              const SizedBox(
                height: 30,
              ),
              confirmOtp
            ],
          )),
    );
  }

  Widget get otpTextField {
    return OtpTextField(
      numberOfFields: 4,
      borderColor: MyColors.appColor,
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
        otpCode = otpCode+code;
      },
    );
  }

  Widget get confirmOtp {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: screenWidget,
        height: 45,
        child: PrimaryElevatedBtn(
            "Confirm OTP",
            () {
              loginController.callVerifyOtp(
                otpCode, arguments['loginWithMobile'], arguments['mobile']);
            },
            borderRadius: 40.0),
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
