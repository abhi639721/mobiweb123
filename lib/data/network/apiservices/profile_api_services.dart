import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:jump_q/constants/Constant.dart';
import 'package:jump_q/data/network/dio_client.dart';
import '../../../models/product/product_list.dart';
import '../../../models/profile/get_user_profile_model.dart';
import '../../../models/profile/userImage/user_image_model.dart';
import '../../../utils/common_util.dart';
class ProfileApiServices extends DioClient {

  final client = DioClient.client;
  final fileData="".obs;
  final userImageUrl="".obs;

  Future<UserProfileModel?> getProfileApi(String authToken) async {
    UserProfileModel? userProfileModel;
    var inputData = {"userId": ""};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getUserDetails",
          data: formData,
          options: Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        userProfileModel = UserProfileModel.fromJson(response.data);
      } catch (e) {
         debugPrint(e.toString());
         Common.showToast(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
      Common.showToast(e.toString());
    }

    return userProfileModel;
  }
  Future<ProductListModel?> updateProfileApi(String authToken,{name,email,mobile,address}) async {
    ProductListModel? productListModel;
    var inputData = {"username": name,"email":email,"mobile":mobile,"address":address};
    debugPrint('inputData: $inputData');
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/userDetailsUpdate",
          data: formData,
          options: Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        productListModel = ProductListModel.fromJson(response.data);
      } catch (e) {
        // print(e.toString());
      }
    } catch (e) {
      // print('Error creating user: $e');
    }

    return productListModel;
  }
  Future<UserImageModel?> updateProfilePickApi(String authToken,String profilePicUrl) async {
    UserImageModel? userImageModel;
    var inputData = {"userImage": profilePicUrl};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/updateUserProfile",
          data: formData,
          options: Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        userImageModel = UserImageModel.fromJson(response.data);
      } catch (e) {
        // print(e.toString());
      }
    } catch (e) {
      // print('Error creating user: $e');
    }

    return userImageModel;
  }

}
