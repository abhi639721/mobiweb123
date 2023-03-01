
import 'package:get/get.dart';

import 'package:jump_q/data/network/apiservices/order_api_services.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';

import '../../data/preferences/AppPreferences.dart';
import '../../models/dashboard/store_data.dart';
import '../../notifire/kart_notifire.dart';

import '../../utils/common_util.dart';
import '../base_getx_controller.dart';

class KartStoreController extends BaseController {
  final NotificationNotifer notifierController =
  Get.find<NotificationNotifer>();
  final apiServices = Get.put(OrderApiServices());
  final appPreferences = Get.find<AppPreferences>();
  late final kartStoreList =<StoreData>[].obs;
  final isLoader = true.obs;
  KartStoreController();
  void callKartStoreApi()async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value=true;
    final response = await apiServices.kartStoreApi(authToken: SharedConfig.authToken);
    isLoader.value=false;
    if(response == null)  Common.showToast("Server error!");
    if(response!.status && response.data!.isNotEmpty){
      kartStoreList.value =response.data??[];
    }else{
      Common.showToast("Something went wrong!");

    }

  }

}
