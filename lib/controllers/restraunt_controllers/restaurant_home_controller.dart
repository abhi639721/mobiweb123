
import 'package:get/get.dart';
import 'package:jump_q/controllers/base_getx_controller.dart';
import 'package:jump_q/data/network/restaurant_apiservices/restaurant_home_api_services.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/utils/common_util.dart';
import '../../models/restaurant_model/Data.dart';

class RestaurantController extends BaseController{
  final apiServices = Get.put(RestaurantHomeApiServices());
  final session = Get.put(Session());
  final isLoader = true.obs;
  final appPreferences = Get.find<AppPreferences>();
  final restaurantList = <Data>[].obs;
  final searchRestaurantList = <Data>[].obs;
  final pageOffSet = true.obs;
  final pageNo = 0.obs;

  RestaurantController();


  void callHomeRestaurantApi(String latitude, String longitude, {page}) async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }

    pageNo.value == 0 ? isLoader.value = true : isLoader.value = false;
    final response = await apiServices.restaurantListApi(
        latitude: latitude,
        longitude: longitude,
        page: page,
        authToken: SharedConfig.authToken);
    print(response);
    isLoader.value = false;
    if (response == null) Common.showToast("Server error!");
    if (response!.status! && response.data!.isNotEmpty) {
      pageNo.value += 1;
      restaurantList.addAll(response.data ?? []);
      searchRestaurantList.addAll(response.data ?? []);


    } else {
      pageOffSet.value = false;
    }
  }


}