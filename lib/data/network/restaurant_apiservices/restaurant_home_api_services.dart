
import 'package:jump_q/data/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jump_q/constants/Constant.dart';
import 'package:jump_q/models/Maintenance_mode.dart';
import 'package:jump_q/models/fcm/AddFCMToken.dart';
import 'package:jump_q/models/kart/add_to_kart.dart';
import 'package:jump_q/models/restaurant_model/Restaurant_list_model.dart';
import 'package:jump_q/models/restaurant_model/cat/Restaurant_menu_model.dart';
import 'package:jump_q/models/restaurant_model/item_model/Restaurant_item_details.dart';
import 'package:jump_q/utils/common_util.dart';

class RestaurantHomeApiServices extends DioClient{
  final client = DioClient.client;



  Future<AddFcmToken?> addUserFcmTokensApi({required deviceId, required token,}
      ) async {
    AddFcmToken? addFcmToken;
    var inputData = {"deviceId" : deviceId, "token": token,};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/addUserFcmTokens",
        data: formData
      );

      if (kDebugMode) {
        print('outPut: ${response.data}');
      }
      try {
        addFcmToken = AddFcmToken.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }
    return addFcmToken;
  }


  ///MaintenanceMode
  Future<MaintenanceModel?> maintenanceApi(
      ) async {
    MaintenanceModel? maintenanceMode;
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/maintenance_mode",
      );

      if (kDebugMode) {
        print('outPut: ${response.data}');
      }
      try {
        maintenanceMode = MaintenanceModel.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }
    return maintenanceMode;
  }



  ///restaurant List API
  Future<RestaurantListModel?> restaurantListApi(
      {required latitude, required longitude, page=0,required authToken}) async {
    RestaurantListModel? restaurantListModel;
    var inputData = {"latitude" : latitude, "longitude": longitude,"page":1};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getRestaurants",
          data: formData,
          options:Common.getOptions(authToken)
      );

      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        restaurantListModel = RestaurantListModel.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return restaurantListModel;
  }

  ///Restaurant Details API
  Future<RestaurantMenuModel?> restaurantDetailApi(
      {required page,required String restaurantId,required authToken}) async {
    RestaurantMenuModel? restaurantMenuModel;
    var inputData = {"page":page,"restaurantId":restaurantId};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getRestaurantsDetails",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        restaurantMenuModel = RestaurantMenuModel.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return restaurantMenuModel;
  }


  ///restaurant item details Api
  Future<RestaurantItemDetails?> itemDetailApi({required restaurantId,required authToken, required restaurantMenuId})async{
    RestaurantItemDetails? restaurantItemDetails;
      var inputData = {"restaurantId":restaurantId,"restaurantMenuId":restaurantMenuId};
      FormData formData = FormData.fromMap(inputData);
      try {
        Response response = await client.post(
            "${Constant.baseUrl}/getRestaurantsMenuItemDetails",
            data: formData,
            options:Common.getOptions(authToken)
        );
        if (kDebugMode) {
          print('inputData: $inputData');
          print('outPut: ${response.data}');
        }
        try {
          restaurantItemDetails = RestaurantItemDetails.fromJson(response.data);
        } catch (e) {
          debugPrint(e.toString());
        }
      } catch (e) {
        debugPrint('Error creating user: $e');
      }

      return restaurantItemDetails;
    }


  Future<AddToKartModel?> addToKartRestaurantApi(
      {required restaurantMenuId,required restaurantId,barcode,quantity,required authToken}) async {
    AddToKartModel? addToKartModel;
    var inputData = {"restaurantMenuId": restaurantMenuId,"restaurantId":restaurantId,"barcode" :barcode,"quantity":quantity};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/addProductToCart",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        addToKartModel = AddToKartModel.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
      // debugPrint('Error creating user: $e');
    }

    return addToKartModel;
  }


}