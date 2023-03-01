


import 'package:get/get.dart';
import 'package:jump_q/controllers/base_getx_controller.dart';
import 'package:jump_q/data/network/restaurant_apiservices/restaurant_home_api_services.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/utils/common_util.dart';

class AddFCMTokenController extends BaseController {
  final apiServices = Get.put(RestaurantHomeApiServices());
  final appPreferences = Get.find<AppPreferences>();
  final session = Get.put(Session());

  void callAddFCMTokenApi(String deviceId,String token) async{
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }

    final response =
    await apiServices.addUserFcmTokensApi(deviceId: deviceId, token: token);
    print(response!.message);
    if(response.status==true){
      print("Add User FCM Token");
    }else{
      print(response.message);
    }


  }







}
