import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../data/network/apiservices/home_api_services.dart';
import '../../data/preferences/AppPreferences.dart';
import '../../utils/common_util.dart';
import '../base_getx_controller.dart';
import '../wish/wish_controller.dart';

class StoreFavoriteController extends BaseController {
  final apiServices = Get.put(HomeApiServices());
  final appPreferences = Get.find<AppPreferences>();
  final controllerWish = Get.find<WishListController>();
  final isFavorite=false.obs;
  void callStoreFavoriteApi(String storeId, bool status)async {
    showLoader();
    final response = await apiServices.storeFavoriteApi(storeId:storeId,status:!status, authToken: appPreferences.authToken);
   hideLoader();
    if(response == null) Common.showToast("Server error");
    if(response!.status){
      isFavorite.value=true;
      controllerWish.callStoreWishListApi();

    }else{
      Common.showToast(response.message);
    }

  }
}