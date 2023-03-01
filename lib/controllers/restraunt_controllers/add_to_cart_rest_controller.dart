


import 'package:get/get.dart';
import 'package:jump_q/controllers/base_getx_controller.dart';
import 'package:jump_q/data/network/restaurant_apiservices/restaurant_home_api_services.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/notifire/kart_notifire.dart';
import 'package:jump_q/utils/common_util.dart';

class RestaurantKartController extends BaseController {
  final apiServices = Get.put(RestaurantHomeApiServices());
  final appPreferences = Get.find<AppPreferences>();
  final NotificationNotifer notifierController =
  Get.find<NotificationNotifer>();
  final totalPrice = 0.obs;
  final totalPaidPrice = 0.obs;


  void callAddToKartApi({
    required String restaurantMenuId,
    required String restaurantId,
    barcode,
    quantity,
    context,
  }) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    String message = "Product added successfully";
    showLoader();
    final response = await apiServices.addToKartRestaurantApi(
        restaurantMenuId: restaurantMenuId,
        restaurantId: restaurantId,
        quantity: quantity,
        authToken: appPreferences.authToken
    );

    hideLoader();
    if (response == null) {
      message = "Server error";
      Common.showToast(message);
      return;
    }

    if (response.status) {
      notifierController.add("1");
      message = response.message;
    } else {
      totalPrice.value = 0;
      totalPaidPrice.value = 0;
      message = response.message;
    }
    Common.showToast(message);
  }

}