
import 'package:get/get.dart';

import 'package:jump_q/data/network/apiservices/order_api_services.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/models/order/OrderData.dart';
import 'package:jump_q/ui/view/commonwidget/snak_bar.dart';
import 'package:jump_q/utils/common_util.dart';
import '../../data/preferences/AppPreferences.dart';

import '../../models/order/order_history_detail_model.dart';
import '../base_getx_controller.dart';

class OrderHistoryController extends BaseController {
  final apiServices = Get.put(OrderApiServices());
  final session = Get.put(Session());
  final appPreferences = Get.find<AppPreferences>();
  List<OrderData> orderList = [];
  final isLoader = true.obs;
  final isLoaderDetail = true.obs;
   late OrderHistoryDetailModel orderHistoryDetailModel;

  OrderHistoryController();

  //get OrderData => null;
  void callOrderHistoryApi() async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value = true;
    final response = await apiServices.orderHistoryApi(
        authToken: appPreferences.authToken, userId: appPreferences.userId);
    isLoader.value = false;
    if (response == null) const SnakBar(message: "Server error");
    if (response!.status) {
      orderList = response.orderData ?? [];
    } else {
      orderList = [];
      Common.showToast(response.message);
    }

  }

  void callOrderHistoryDetailApi(
      String orderId) async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoaderDetail.value = true;
    final response = await apiServices.orderHistoryDetailApi(
        orderId: orderId, authToken: appPreferences.authToken);
    isLoaderDetail.value = false;
    if (response == null) const SnakBar(message: "Server error");
    if (response!.status) {
      orderHistoryDetailModel=response;
    } else {

      return null;
    }
  }
}
