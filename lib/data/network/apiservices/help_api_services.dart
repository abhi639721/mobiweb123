import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:jump_q/constants/Constant.dart';
import 'package:jump_q/data/network/dio_client.dart';
import '../../../models/help/HelpModel.dart';
import '../../../utils/common_util.dart';
class HelpApiServices extends DioClient {

  final client = DioClient.client;
  final fileData = "".obs;
  //final userImageUrl = "".obs;
  Future<HelpModel?> getHelpApi(String authToken,
      {name, email, mobile, message}) async {
    HelpModel? helpModel;
    var inputData = {
      "name": name,
      "email": email,
      "mobile": mobile,
      "message": message
    };
    debugPrint('inputData: $inputData');
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/userHelp",
          data: formData,
          options: Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        helpModel = HelpModel.fromJson(response.data);
      } catch (e) {
        // print(e.toString());
      }
    } catch (e) {
      // print('Error creating user: $e');
    }

    return helpModel;
  }

}
