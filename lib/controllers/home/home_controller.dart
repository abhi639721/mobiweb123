import 'package:get/get.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/helper/session.dart';
import '../../data/network/apiservices/home_api_services.dart';
import '../../data/preferences/AppPreferences.dart';
import '../../models/dashboard/store_data.dart';
import '../../utils/common_util.dart';
import '../base_getx_controller.dart';

class HomeStoreController extends BaseController {
  final apiServices = Get.put(HomeApiServices());
  final session = Get.put(Session());
  final appPreferences = Get.find<AppPreferences>();

  final storeList = <StoreData>[].obs;
  final searchStoreList = <StoreData>[].obs;
  final isLoader = true.obs;
  final pageOffSet = true.obs;
  final pageNo = 0.obs;

  HomeStoreController();

  void callHomeStoreApi(String latitude, String longitude, {page}) async {
    bool connectionResult = await Common.inInternet();
   if(!connectionResult){
     Common.showToast("No Internet Connection!");
     return;
   }

    pageNo.value == 0 ? isLoader.value = true : isLoader.value = false;
    final response = await apiServices.homeStoreApi(
        latitude: latitude,
        longitude: longitude,
        page: page,
        authToken: SharedConfig.authToken);
    isLoader.value = false;
    if (response == null) Common.showToast("Server error!");
    if (response!.status && response.data!.isNotEmpty) {
      pageNo.value += 1;
      storeList.addAll(response.data ?? []);
      searchStoreList.addAll(response.data ?? []);
    } else {
      pageOffSet.value = false;
    }
  }

  void onSearch(String name) {
    searchStoreList.clear();
    if (name.isNotEmpty) {
      searchStoreList.addAll(storeList
          .where((i) => i.store_name.toLowerCase().contains(name))
          .toList());
    } else {
      searchStoreList.addAll(storeList);
    }
  }
}
