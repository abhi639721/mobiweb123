import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jump_q/constants/Constant.dart';
import 'package:jump_q/data/network/dio_client.dart';

import '../../../models/product/product_list.dart';

class ProductApiServices extends DioClient {

  final client = DioClient.client;

  Future<ProductListModel?> productListApi(
      { storeId,   barcode, categoryId ,page}) async {
    ProductListModel? productListModel;
    var inputData = {"storeId": storeId, "barcode": barcode,"categoryId":categoryId,"page":page};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/getStoreProductsList",
        data: formData,
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
  Future<ProductListModel?> searchListApi(
      { search}) async {
    ProductListModel? productListModel;
    var inputData = {"search":search};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/searchProduct",
        data: formData,
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
}
