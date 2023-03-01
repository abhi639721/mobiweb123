import 'package:dio/dio.dart';
import 'package:jump_q/models/offers/offers_model.dart';
import '../../../constants/Constant.dart';

import 'package:flutter/foundation.dart';

import '../dio_client.dart';
class OffersApiServices extends DioClient {

  final client = DioClient.client;
  Future<OffersModel?> offersApi() async {
    OffersModel? offersModel;
    var inputData = {"userId":""};
    debugPrint('inputData: $inputData');
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getOffers",
          data: formData,
      );
      if (kDebugMode) {

        debugPrint('outPut: ${response.data}');
      }
      try {
        offersModel = OffersModel.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return offersModel;
  }
}