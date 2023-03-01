import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jump_q/constants/Constant.dart';
import 'package:jump_q/data/network/dio_client.dart';
import 'package:jump_q/models/common_message_model.dart';
import 'package:jump_q/models/loginandsignup/LoginResponseModel.dart';

import '../../../utils/common_util.dart';

class LoginApiServices extends DioClient {
/*  Options get _options => Options(
      headers: {"Authorization": "sfsdfsdgfgfgfgfdgfd", "device": "mobile"});*/
  final client = DioClient.client;

  Future<LoginResponseModel?> loginApi(
      {required userName, required password}) async {
    LoginResponseModel? retrievedUser;
    var inputData = {"login": userName, "password": password};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/login",
        data: formData,
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        retrievedUser = LoginResponseModel.fromJson(response.data);
      } catch (e) {
        // print(e.toString());
      }
    } catch (e) {
      // print('Error creating user: $e');
    }

    return retrievedUser;
  }

  Future<CommonResponseModel?> getOtpApi({required mobile}) async {
    CommonResponseModel? commonResponseModel;
    var inputData = {
      "mobile": mobile,
    };
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/sendotp",
        data: formData,
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
      } catch (e) {
        Common.showToast("Server error!");
      }
    } catch (e) {
      Common.showToast("Server error!");
    }

    return commonResponseModel;
  }

  Future<CommonResponseModel?> getSignUpApi(
      {username, email, mobile, password}) async {
    CommonResponseModel? commonResponseModel;
    var inputData = {
      "username": username,
      "email": email,
      "mobile": mobile,
      "password": password
    };
    FormData formData = FormData.fromMap(inputData);
    debugPrint('inputData: $inputData');
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/signup",
        data: formData,
      );

      debugPrint('outPut: $response');

      try {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
      } catch (e) {
        Common.showToast("Server error!");
      }
    } catch (e) {
      Common.showToast("Server error!");
    }

    return commonResponseModel;
  }

  Future<LoginResponseModel?> getVerifyOtpApi(
      {required otpCode, required, mobile}) async {
    LoginResponseModel? retrievedUser;
    var inputData = {"otp": otpCode, "mobile": mobile};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/verifyotp",
        data: formData,
      );
      print('outPut: ${response.data}');
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        retrievedUser = LoginResponseModel.fromJson(response.data);
      } catch (e) {
// print(e.toString());
      }
    } catch (e) {
// print('Error creating user: $e');
    }

    return retrievedUser;
  }

  Future<CommonResponseModel?> getUpdatePasswordApi(
      {required oldPassword, required, newPassword, required authToken}) async {
    CommonResponseModel? commonResponseModel;
    var inputData = {
      "old_password": oldPassword,
      "new_password": newPassword,
    };
    debugPrint('inputData {$inputData}');

    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/changepassword",
          data: formData,
          options: Common.getOptions(authToken));
      print(response);
      if (kDebugMode) {
        print('outPut: ${response.data}');
      }
      try {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
      } catch (e) {
        Common.showToast("Server error!");
      }
    } catch (e) {
      Common.showToast("Server error!");
    }
    return commonResponseModel;
  }

  Future<CommonResponseModel?> getForgetPasswordApi(
      {required newPassword, required confirmPassword, required String login}) async {
    CommonResponseModel? commonResponseModel;
    var inputData = {
      "new_password": newPassword,
      "confirm_password": confirmPassword,
      "login" : login
    };
    debugPrint('inputData {$inputData}');

    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/forgetpassword",
          data: formData,
         // options: Common.getOptions(authToken)
);
      print(response);
      if (kDebugMode) {
        print('outPut: ${response.data}');
      }
      try {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
      } catch (e) {
        Common.showToast("Server error!");
      }
    } catch (e) {
      Common.showToast("Server error!");
    }
    return commonResponseModel;
  }
}
