


import 'package:get/get.dart';
import 'package:jump_q/controllers/base_getx_controller.dart';
import 'package:jump_q/data/network/restaurant_apiservices/restaurant_home_api_services.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/models/Maintenance_mode.dart';
import 'package:jump_q/utils/common_util.dart';

class MaintenanceController extends BaseController{
  final apiServices = Get.put(RestaurantHomeApiServices());
  final session = Get.put(Session());
  final isLoader = true.obs;
   late MaintenanceModel maintenanceModel;
  MaintenanceController();


  void callMaintenanceApi() async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }

    final response = await apiServices.maintenanceApi(
       );
    print(response);
    isLoader.value = false;
    if (response == null) Common.showToast("Server error!");
    if (response!.status!= false) {
      maintenanceModel =response;
      // if(maintenanceModel.maintenanceMode!.isNotEmpty&&maintenanceModel.status!=false) {
      //   maintenanceModel = MaintenanceModel.fromJson(response.toString());
      // }

    } else {

    }
  }



}