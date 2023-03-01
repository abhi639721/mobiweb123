import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jump_q/data/network/apiservices/order_api_services.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/models/common_message_model.dart';
import 'package:jump_q/models/getCoupen/CoupenData.dart';
import 'package:jump_q/models/kart/KartData.dart';
import 'package:jump_q/models/kart/kart_list.dart';
import 'package:jump_q/models/payment/Data.dart';
import 'package:jump_q/ui/view/commonwidget/snak_bar.dart';
import '../../data/preferences/AppPreferences.dart';
import '../../models/dashboard/store_data.dart';
import '../../notifire/kart_notifire.dart';
import '../../ui/view/product/order/payment_complete.dart';
import '../../utils/common_util.dart';
import '../base_getx_controller.dart';

class KartController extends BaseController {

  final NotificationNotifer notifierController =
  Get.find<NotificationNotifer>();
  final apiServices = Get.put(OrderApiServices());
  final appPreferences = Get.find<AppPreferences>();
  late final kartStoreList = <StoreData>[].obs;
  final caseOnCounter = "".obs;
  List<KartData> kartList = [];
  Data? data;
  late CommonResponseModel commonResponseModel;
  final totalPrice = 0.obs;
   var name = "";
  var mobile = "";
  var address = "";
  var deliveryAs = "";
  final totalPaidPrice = 0.obs;
  final discountCountPrice = 0.obs;
  final getCoupon = "".obs;
  final isLoader = true.obs;
  final addKart = false.obs;
  final isCouponLoader = true.obs;
  KartModel? kartModel;
  KartController();

  void callKartListApi() async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }

    isLoader.value = true;
    final response = await apiServices.kartListApi(
        authToken: appPreferences.authToken, userId: SharedConfig.userId);
    isLoader.value = false;
    print("response $response");
    if (response == null) const SnakBar(message: "Server error");
    if (response!.status) {

      kartList = response.kartData ?? [];
      totalPrice.value = int.parse(response.grandTotal.toString());
      totalPaidPrice.value = int.parse(response.grandTotal.toString());
      name = response.name ;
      address = response.address;
      mobile = response.mobile;
      deliveryAs=response.deliveryAs;

    } else {
      kartList = [];
      SnakBar(message: response.message);
    }
  }

  Future<List<CouponData>> callGetCouponApi() async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
    }

    isCouponLoader.value = true;
    final response =
        await apiServices.getCouponApi(authToken: appPreferences.authToken);
    isCouponLoader.value = false;
    if (response == null) const SnakBar(message: "Server error");
    if (response!.status) {
      return response.couponData;
    } else {
      Common.showToast(response.message);
      return [];
    }
  }

  void callKartUpdateApi(
      {required String cartId, required String quantity}) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    showLoader();
    final response = await apiServices.kartUpdateApi(
        cartId: cartId,
        quantity: quantity,
        authToken: appPreferences.authToken);
    hideLoader();
    if (response == null) const SnakBar(message: "Server error");
    if (response!.status) {
      totalPrice.value = int.parse(response.grandTotal);
      totalPaidPrice.value = int.parse(response.grandTotal.toString());
    } else {
      totalPrice.value = 0;
      totalPaidPrice.value = 0;

      SnakBar(message: response.message);
    }
  }

  void callAddToKartApi({
    required String storeProductId,
    required String storeId,
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
    final response = await apiServices.addToKartApi(
        storeProductId: storeProductId,
        storeId: storeId,
        barcode: barcode,
        quantity: quantity,
        authToken: appPreferences.authToken);
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

  void callRemoveToKartApi({
    required String cartId,
    required int position,
    context,
  }) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    String message = "Product added successfully";
    showLoader();
    final response = await apiServices.removeToKartApi(
        cartId: cartId, authToken: appPreferences.authToken);
    hideLoader();
    if (response == null) {
      message = "Server error";
      return;
    }

    if (response.status) {
      addKart.value = true;
      notifierController.del();
      kartList.removeAt(position);
      message = response.message;
      callKartListApi();
    } else {
      totalPrice.value = 0;
      totalPaidPrice.value = 0;
      message = response.message;
    }
    Common.showToast(message);
  }

  void callKartCountApi() async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    final response =
        await apiServices.getKartCountApi(authToken: appPreferences.authToken);

    if (response == null) {
      return;
    }

    if (response.status) {
      for (int i = 1; i <= response.cartCount; i++) {
        notifierController.add("1");
      }
    }
  }

  void callProceedToPayApi(String storeId) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    showLoader();
    final response = await apiServices.proceedToPayApi(
        storeId: storeId, authToken: appPreferences.authToken);
    hideLoader();
    if (response == null) {
      return null;
    }
    if (response.status) {
      PaymentComplete.start(response.data, true);
      notifierController.clearList();
    } else {
      PaymentComplete.start(response.data, false);
      Common.showToast("Something went wrong!");
    }
  }

  void callCreateOrderApi({paymentType}) async {
    showLoader();
    final response = await apiServices.createOrderApi(
        couponCode: getCoupon,
        paymentMethod: paymentType,
        couponApplied: getCoupon.isEmpty ? 0 : 1,
        authToken: appPreferences.authToken);
    debugPrint(response.toString());

    if (response == null) {
      debugPrint("nullables$response");
      hideLoader();
      return;
    }
    if (response.status) {
      final responsePaymentToken = await apiServices.createPaymentTokenApi(
        orderId: response.createData?.orderId,
        orderCurrency: "INR",
        orderAmount: response.createData?.orderAmount.toString(),
      );
      hideLoader();
      if (responsePaymentToken?.status == "OK") {
        processPayment(
            response.createData?.orderId.toString(),
            responsePaymentToken?.cftoken,
            response.createData?.orderAmount.toString());
      }
    } else {
      hideLoader();
      Common.showToast("Something went wrong!");
      return null;
    }
  }

  void callCreateAtCOCOrderApi({paymentType}) async {
    showLoader();
    final response = await apiServices.createOrderApi(
        couponCode: getCoupon,
        paymentMethod: paymentType,
        couponApplied: getCoupon.isEmpty ? 0 : 1,
        authToken: appPreferences.authToken);

    if (response == null) {
      hideLoader();
      return null;
    }
    if (response.status) {
      final responsePaymentToken = await apiServices.createPaymentTokenApi(
        orderId: response.createData?.orderId,
        orderCurrency: "INR",
        orderAmount: response.createData?.orderAmount.toString(),
      );
      hideLoader();
      if (responsePaymentToken?.status == "OK") {
        callPaymentAtCOCApi(response.createData!.orderId.toString(), "", "", "",
            response.createData!.orderAmount.toString(), "", "", "");
      }
    } else {
      hideLoader();
      Common.showToast("Something went wrong!");
      return null;
    }
  }

  void processPayment(
      String? orderDataId, String? paymentToken, String? orderAmountt) {
    notifierController.clearList();
    String stage = "TEST";
    String orderId = orderDataId.toString();
    String orderAmount = orderAmountt.toString();
    String tokenData = paymentToken.toString();
    String customerName = appPreferences.userName;
    String orderNote = "Order Note optional";
    String orderCurrency = "INR";
    String appId = "2383135b2159738f9f5fe49ab9313832";
    String customerPhone = "8527673533";
    String customerEmail = appPreferences.email;
    String notifyUrl = "https://test.gocashfree.com/notify";
    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };
    Map<String, String> map = {};
    CashfreePGSDK.doPayment(inputParams).then((value) => callPaymentApi(
        orderId,
        value!["referenceId"].toString(),
        value["signature"],
        value.toString(),
        orderAmount,
        value["paymentMode"],
        value["txMsg"],
        value["txStatus"]));
  }

  void callPaymentApi(
      String orderId,
      String paymentId,
      String signatureHash,
      String responseJson,
      String amount,
      String paymentStatus,
      String message,
      String txStatus) async {
    showLoader();
    final response = await apiServices.createPaymentApi(
        orderId: orderId,
        paymentId: paymentId,
        signatureHash: signatureHash,
        responseJson: responseJson,
        amount: amount,
        paymentStatus: txStatus,
        authToken: appPreferences.authToken);
    hideLoader();
    if (response == null) {
      return null;
    }
    if (response.status) {
      if (message.isNotEmpty) {
        Common.showToast(message);
        if (txStatus == "SUCCESS") {
          PaymentComplete.start(response.data, true);
        } else {
          PaymentComplete.start(null, false);
        }
      }
    } else {
      Common.showToast("Something went wrong!");
      return null;
    }
  }

  void callPaymentAtCOCApi(
      String orderId,
      String paymentId,
      String signatureHash,
      String responseJson,
      String amount,
      String paymentStatus,
      String message,
      String txStatus) async {
    showLoader();
    final response = await apiServices.createPaymentApi(
        orderId: orderId,
        paymentId: paymentId,
        signatureHash: signatureHash,
        responseJson: responseJson,
        amount: amount,
        paymentStatus: "SUCCESS",
        authToken: appPreferences.authToken);
    hideLoader();
    if (response == null) {
      return null;
    }
    if (response.status) {
      Common.showToast(response.message);
      PaymentComplete.start(response.data, true);
    } else {
      Common.showToast("Something went wrong!");
      PaymentComplete.start(response.data, false);
      return null;
    }
  }

  Future<Data?> callCompletePaymentApi(
      String orderId,
      String paymentId,
      String signatureHash,
      String responseJson,
      String amount,
      String paymentStatus,
      String message,
      String txStatus) async {
    showLoader();
    final response = await apiServices.createPaymentApi(
        orderId: orderId,
        paymentId: paymentId,
        signatureHash: signatureHash,
        responseJson: responseJson,
        amount: amount,
        paymentStatus: txStatus,
        authToken: appPreferences.authToken);
    hideLoader();
    if (response == null) {
      debugPrint(response.toString());
      return null;
    }
    if (response.status && response.data != null) {
      commonResponseModel = response;
      data = commonResponseModel.data;

      //  data = commonResponseModel?.data;
    } else {
      Common.showToast("Something went wrong!");
      return response.data;
    }
    return null;
  }

  void resetList() {
    isLoader.value = false;
  }

  //////////Add Delivery Address Api controller
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final pinCodController = TextEditingController();
  final addressController = TextEditingController();
  final townController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();


  Future<void> callAddDeliveryAddressApi({required saveAs,required openOnSunday,required openOnSaturday}) async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value = true;
    final response = await apiServices.addDeliveryAddress(
        name: nameController.text,
        mobile: mobileController.text,
        pin_code: pinCodController.text,
        address: addressController.text,
        town_locality: townController.text,
        city: cityController.text,
        state: stateController.text,
        save_as: saveAs,
        openOnSunday: openOnSunday,
        openOnSaturday: openOnSaturday,
        authToken: appPreferences.authToken);
    isLoader.value = false;
    Common.showToast(response!.message.toString());
    if (response == null)

      const SnakBar(message: "Network issue");
    if(response!=null ) {

        Common.showToast(response.message.toString());

      Get.back();
    } else{

    }
  }
}
