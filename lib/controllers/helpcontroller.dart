
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jump_q/ui/view/commonwidget/snak_bar.dart';
import 'package:jump_q/utils/common_util.dart';
import '../../data/preferences/AppPreferences.dart';
import '../data/network/apiservices/help_api_services.dart';
import 'base_getx_controller.dart';

class HelpController extends BaseController {
  final apiServices = Get.put(HelpApiServices());
  final appPreferences = Get.find<AppPreferences>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final messageController = TextEditingController();
  final isLoader = true.obs;
  HelpController();
  @override
  void onInit() {
    callHelpApi();
    super.onInit();
  }
  void callHelpApi() async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value = true;
    final response = await apiServices.getHelpApi(appPreferences.authToken,
        name: nameController.text,
        mobile: mobileController.text,
        email: emailController.text,
        message: messageController.text);
    isLoader.value = false;
    if (response == null) const SnakBar(message: "Network issue");
    if(response!=null ) {
      SnakBar(message){
        Common.showToast(message);

   Get.back();
 }
    } else{

    }

  }
}

// if(response!=null && response.status){
//   Common.showToast(response.message);
//   Get.back();
// }else{
//
//   Common.showToast(response!.message);
