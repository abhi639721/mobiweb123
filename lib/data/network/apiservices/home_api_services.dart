import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jump_q/constants/Constant.dart';
import 'package:jump_q/data/network/dio_client.dart';
import 'package:jump_q/models/common_message_model.dart';
import 'package:jump_q/models/dashboard/home_page_store_model.dart';
import 'package:jump_q/models/dashboard/storeDetail.dart';
import 'package:jump_q/utils/common_util.dart';


class HomeApiServices extends DioClient {

  final client = DioClient.client;
  Future<HomePageStoreModel?> homeStoreApi(
      {required latitude, required longitude, page=0,required authToken}) async {
    HomePageStoreModel? retrievedUser;
    var inputData = {"latitude": latitude, "longitude": longitude,"page":page};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/getHomeData",
        data: formData,
        options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        retrievedUser = HomePageStoreModel.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return retrievedUser;
  }

  Future<StoreDetailModel?> storeDetailApi(
      {required page,required store_id,required authToken}) async {
    StoreDetailModel? retrievedUser;
    var inputData = {"page":page,"store_id":store_id};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getStoresDetails",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        retrievedUser = StoreDetailModel.fromJson(response.data);
      } catch (e) {
         debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return retrievedUser;
  }


  Future<CommonResponseModel?> storeFavoriteApi(
      {required storeId, required status,required authToken}
      ) async {
    CommonResponseModel? commonResponseModel;
    var inputData = {"storeId": storeId, "status": status,};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/addFavouriteStore",
          data: formData,
          options:Common.getOptions(authToken)
      );

        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');

      try {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return commonResponseModel;
  }
}
