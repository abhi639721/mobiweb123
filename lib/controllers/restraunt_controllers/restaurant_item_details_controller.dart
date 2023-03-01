




import 'package:get/get.dart';
import 'package:jump_q/controllers/base_getx_controller.dart';
import 'package:jump_q/data/network/restaurant_apiservices/restaurant_home_api_services.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/models/restaurant_model/item_model/Data.dart';
import 'package:jump_q/models/restaurant_model/item_model/Options.dart';
import 'package:jump_q/models/restaurant_model/item_model/Restaurant_item_details.dart';
import 'package:jump_q/utils/common_util.dart';

class RestaurantItemDetailsController extends BaseController {
  final apiServices = Get.put(RestaurantHomeApiServices());
  final session = Get.put(Session());
  final isLoader = true.obs;
  final appPreferences = Get.find<AppPreferences>();
   ItemData ?itemData;
  List<Options> options = [];
  final pageOffSet = true.obs;
  final pageNo = 0.obs;
  RestaurantItemDetailsController();
  RestaurantItemDetails? restaurantItemDetails;

  void callRestaurantItemDetailApi(
      String restaurantId ,String restaurantMenuId) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value = true;
    final response = await apiServices.itemDetailApi(
        restaurantId: restaurantId, authToken: SharedConfig.authToken, restaurantMenuId: restaurantMenuId);
    isLoader.value = false;
    print("response ==${response}");
    if (response == null) {
      Common.showToast("Network Problem!");
      return;
    }



    try {
      if (response.status != false) {
        restaurantItemDetails = response;

        if (restaurantItemDetails!.data != null &&
            restaurantItemDetails!.data != null) {
          itemData = restaurantItemDetails!.data!;
        }


        if (restaurantItemDetails!.data != null &&
            restaurantItemDetails!.data!.options!.isNotEmpty) {
          options = restaurantItemDetails!.data!.options!;
        }
      } else {
        // print("object");
        //  Common.showToast("message: restaurantManuModels.message") ;
        //SnakBar(message: restaurantItemDetails.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
