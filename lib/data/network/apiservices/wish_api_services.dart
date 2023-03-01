import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jump_q/constants/Constant.dart';
import 'package:jump_q/data/network/dio_client.dart';
import 'package:jump_q/models/wish/add_wish_product.dart';
import '../../../models/dashboard/home_page_store_model.dart';
import '../../../models/product/product_list.dart';
import '../../../utils/common_util.dart';
class WishApiServices extends DioClient {

  final client = DioClient.client;

  Future<ProductListModel?> wishListApi(String authToken) async {
    ProductListModel? productListModel;
    var inputData = {"storeId": ""};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getUserProductWishlist",
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

  Future<HomePageStoreModel?> storeWishListApi(String authToken) async {
    HomePageStoreModel? productListModel;
    var inputData = {"storeId": ""};
    FormData formData = FormData.fromMap(inputData);
    debugPrint('inputData: $inputData');
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getFavouriteStores",
          data: formData,
          options: Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('outPut: ${response.data}');
      }
      try {
        productListModel = HomePageStoreModel.fromJson(response.data);
      } catch (e) {
        // print(e.toString());
      }
    } catch (e) {
      // print('Error creating user: $e');
    }

    return productListModel;
  }

  Future<AddWishProductModel?> addWishProductApi(String storeId,
      String storeProductId, String authToken) async {
    AddWishProductModel? productListModel;
    var inputData = {"storeId": storeId, "storeProductId": storeProductId};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/addProductToWishlist",
          data: formData,
          options: Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        productListModel = AddWishProductModel.fromJson(response.data);
      } catch (e) {
        // print(e.toString());
      }
    } catch (e) {
      // print('Error creating user: $e');
    }
    return productListModel;
  }
}
