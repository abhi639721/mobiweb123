import 'package:get/get.dart';
import 'package:jump_q/models/offers/OffersData.dart';
import 'package:jump_q/utils/common_util.dart';

import '../../data/network/apiservices/offers_api_services.dart';
import '../base_getx_controller.dart';

class OffersController extends BaseController {

  final apiServices = Get.put(OffersApiServices());
  final isLoader = true.obs;
   List<OffersData> offersList =<OffersData>[];
  @override
  void onInit() {
    callOffersApi();
    super.onInit();
  }
  void callOffersApi()async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value=true;
    final response = await apiServices.offersApi();
    isLoader.value=false;
    if(response == null) Common.showToast("Server Error!");
    if(response!=null && response.status){
      if(response.offersData.isNotEmpty){
        offersList=response.offersData;
      }


    }else{

      Common.showToast(response!.message);


    }

  }
}