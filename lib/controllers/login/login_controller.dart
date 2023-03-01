import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:jump_q/data/network/apiservices/login_api_services.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/notifire/image_notifire.dart';
import 'package:jump_q/services/navigator.dart';

import 'package:jump_q/ui/view/home/home.dart';
import 'package:jump_q/ui/view/loginandsignup/login_page.dart';
import 'package:jump_q/ui/view/loginandsignup/otp.dart';
import 'package:jump_q/ui/view/loginandsignup/set_password.dart';
import 'package:jump_q/utils/common_util.dart';
import 'package:provider/provider.dart';
import '../../data/preferences/AppPreferences.dart';
import '../base_getx_controller.dart';
import '../kart/KartController.dart';

class LoginController extends BaseController {
  final apiServices = Get.put(LoginApiServices());
  final appPreferences = Get.find<AppPreferences>();
  final session = Get.put(Session());
  final userNameController = TextEditingController();
  final getEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final kartController = Get.put(KartController());
  final getOtpMobileController = TextEditingController();
  final getUserNameController = TextEditingController();

  final getMobileController = TextEditingController();
  final getPasswordController = TextEditingController();
  final getConfirmPasswordController = TextEditingController();
  final getOtpController = TextEditingController();
  final getOldPasswordController = TextEditingController();
  final getNewPasswordController = TextEditingController();
  final getConfirmNewPasswordController = TextEditingController();

  final isLoader = true.obs;

  LoginController();

  void loginButtonClick() {
    if (userNameController.text.toString().isEmpty) {
      Common.showToast("User id can't be empty!");
      //Toast
    } else if (passwordController.text.toString().isEmpty) {
      Common.showToast("Password can't be empty!");
    } else {
      showLoader();
      callLoginApi(userNameController.text.toString(),
          passwordController.text.toString());
    }
  }

  void callLoginApi(String userName, String password) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    final response =
        await apiServices.loginApi(userName: userName, password: password);

    hideLoader();
    if (response == null) Common.showToast("Server error");

    if (response!.status) {
      appPreferences.saveEmail(response.data!.email);
      appPreferences.saveUserId(response.data!.id);
      appPreferences.saveUserName(response.data!.name);
      appPreferences.saveUserImage(response.data!.image);
      appPreferences.saveAuthToken(response.token);
      appPreferences.saveLoggedIn(true);
      kartController.callKartCountApi();
      Provider.of<ProfileImageNotifier>(Get.context!,listen: false).onChangeImage(response.data!.image);
      Home.start('0');
     // navigateOffAll(Home.routeName);
    } else {
      Common.showToast(response.message);
    }
  }

  void callGetOtpApi(String mobile, bool isLogin) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    final response = await apiServices.getOtpApi(mobile: mobile);
    hideLoader();
    if (response == null) Common.showToast("Server error");
    bool isVerified=response?.status??false;
    if (isVerified) {
      Otp.start(false,getOtpMobileController.text.toString());
    } else {
      Common.showToast(response?.message??"");
    }
  }

  void getOtpButtonClick(bool isLogin) {
    if (getOtpMobileController.text.toString().isEmpty) {
      Common.showToast("User mobile can't be empty!");
      //Toast
    } else {
      showLoader();
      callGetOtpApi(getOtpMobileController.text.toString(), isLogin);
    }
  }

  void callSignUpApi() async {
    final response = await apiServices.getSignUpApi(
        username: getUserNameController.text.toString(),
        email: getEmailController.text.toString(),
        mobile: getMobileController.text.toString(),
        password: getPasswordController.text.toString());
    hideLoader();
    if (response?.status??false) {
      Otp.start(true, getMobileController.text.toString());
    } else {
      Common.showToast(response?.message??"");
    }
  }

  void getSignUpButtonClick() {
    if (getUserNameController.text.toString().isEmpty) {
      Common.showToast("User name can't be empty!");
      return;
    }
    if (getEmailController.text.toString().isEmpty) {
      Common.showToast("User email can't be empty!");
      return;
    }
    if (getMobileController.text.toString().isEmpty) {
      Common.showToast("User mobile can't be empty!");
      return;
    }
    if (getPasswordController.text.toString().isEmpty) {
      Common.showToast("User password can't be empty!");
      return;
    }
    if (getConfirmPasswordController.text.toString().isEmpty) {
      Common.showToast("User confirm password can't be empty!");
      return;
    }
    if (getConfirmPasswordController.text.toString() !=
        getPasswordController.text.toString()) {
      Common.showToast("User confirm password not matched!");
      return;
    }
    showLoader();
    callSignUpApi();
  }

  void callVerifyOtp(
      String otpCode, bool loginWithMobile, String mobile) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    showLoader();
    final response =
        await apiServices.getVerifyOtpApi(otpCode: otpCode, mobile: mobile);
    hideLoader();
    if (response == null) Common.showToast("Server error");
    if (response?.status??false) {
      appPreferences.saveEmail(response?.data?.email??"");
      appPreferences.saveUserId(response?.data?.id??"");
      appPreferences.saveUserName(response?.data?.name??"");
      appPreferences.saveUserImage(response?.data?.image??"");
      appPreferences.saveAuthToken(response?.token??"");
      appPreferences.saveLoggedIn(true);
      kartController.callKartCountApi();
     // Home.start("0");
     // navigateOffAll(Home.routeName);
     loginWithMobile ? navigateOffAll(Home.routeName) : SetPassword.start(getOtpMobileController,loginWithMobile);
    } else {
      Common.showToast(response?.message??"");
    }
  }
  void getForgetPasswordButtonClick() {
    if (getNewPasswordController.text.toString().isEmpty)
    {
      Common.showToast("New Password can't be empty!");
      return;
    }
    if (getConfirmNewPasswordController.text.toString().isEmpty) {
      Common.showToast("Confirm  password can't be empty!");
      return;
    }
    if (getConfirmNewPasswordController.text.toString() !=
        getNewPasswordController.text.toString()) {
      Common.showToast("Confirm password did not matched!");
      return;
    }
    showLoader();
    callPasswordForgetApi(getMobileController);
  }

  void callPasswordForgetApi(mobile) async {
    final response = await apiServices.getForgetPasswordApi(
        newPassword: getNewPasswordController.text.toString(),
        confirmPassword: getConfirmNewPasswordController.text.toString(),
        login : appPreferences.email
    );
    debugPrint('data == $response');
    hideLoader();
    if (response == null) Common.showToast("Server error");

    if (response?.status??false) {
      Home.start("0");
    } else {
      Common.showToast(response?.message??"Some thing went wrong!");
      // Common.showToast("Some thing went wrong!");
    }
  }

  void getUpdatePasswordButtonClick() {
    if (getOldPasswordController.text.toString().isEmpty) {
      debugPrint(getPasswordController.toString());
      Common.showToast("Old password can't be empty!");
      return;
    }
    if (getNewPasswordController.text.toString().isEmpty) {
      Common.showToast("New Password can't be empty!");
      return;
    }
    if (getConfirmNewPasswordController.text.toString().isEmpty) {
      Common.showToast("Confirm  password can't be empty!");
      return;
    }
    if (getConfirmNewPasswordController.text.toString() !=
        getNewPasswordController.text.toString()) {
      Common.showToast("Confirm password did not matched!");
      return;
    }

    showLoader();
    callPasswordUpdateApi();
  }

  void callPasswordUpdateApi() async {
    final response = await apiServices.getUpdatePasswordApi(
        oldPassword: getOldPasswordController.text.toString(),
        newPassword: getNewPasswordController.text.toString(),
        authToken: appPreferences.authToken);

    debugPrint('data == $response');
    hideLoader();
    if (response == null) Common.showToast("Server error");

    if (response?.status??false) {
      LogInScreen.start();
    } else {
      Common.showToast(response?.message??"Some thing went wrong!");
     // Common.showToast("Some thing went wrong!");
    }
  }
}
