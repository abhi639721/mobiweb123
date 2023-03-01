import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jump_q/constants/Constant.dart';
import 'package:jump_q/controllers/createOrder/create_order.dart';
import 'package:jump_q/controllers/tokenModel/payment_token_model.dart';
import 'package:jump_q/data/network/dio_client.dart';
import 'package:jump_q/models/common_message_model.dart';
import 'package:jump_q/models/kart/kart_list.dart';
import 'package:jump_q/models/order/Add_delivery_address_model.dart';
import 'package:jump_q/models/order/order_history.dart';
import '../../../models/dashboard/home_page_store_model.dart';
import '../../../models/getCoupen/get_coupen_model.dart';
import '../../../models/kart/add_to_kart.dart';
import '../../../models/kart/cart_update.dart';
import '../../../models/kart/kart_count.dart';
import '../../../models/order/order_history_detail_model.dart';
import '../../../utils/common_util.dart';

class OrderApiServices extends DioClient {

  final client = DioClient.client;
  var name = "";


  Future<HomePageStoreModel?> kartStoreApi(
      {required authToken}) async {
    HomePageStoreModel? retrievedUser;
    var inputData = {"userId":"1"};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getCartStoreList",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        retrievedUser = HomePageStoreModel.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return retrievedUser;
  }

  Future<OrderHistoryModel?> orderHistoryApi(
      {required userId,required authToken}) async {
    OrderHistoryModel? orderHistoryModel;
    var inputData = {"userId": userId};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/getOrderHistoryList",
        data: formData,
        options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        orderHistoryModel = OrderHistoryModel.fromJson(response.data);
      } catch (e) {
         debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return orderHistoryModel;
  }

  Future<OrderHistoryDetailModel?> orderHistoryDetailApi(
      {required orderId,required authToken}) async {
    OrderHistoryDetailModel? orderHistoryDetailModel;
    var inputData = {"orderId": orderId};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getOrderItemsList",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('$response.data');
        debugPrint('outPut: ${response.data}');
      }
      try {
        orderHistoryDetailModel = OrderHistoryDetailModel.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint('Error creating user: $e');
    }

    return orderHistoryDetailModel;
  }

  Future<KartModel?> kartListApi(
      {required userId,required authToken}) async {
    KartModel? kartModel;
    var inputData = {"userId": userId};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getUserCartList",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        kartModel = KartModel.fromJson(response.data);
        name = kartModel.name;
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
       debugPrint('Error creating user: $e');
    }

    return kartModel;
  }

  Future<KartUpdateModel?> kartUpdateApi(
      {required cartId,required quantity,required authToken}) async {
     KartUpdateModel? kartUpdateModel;
    var inputData = {"cartId": cartId,"quantity":quantity};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/updateProductToCart",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        kartUpdateModel = KartUpdateModel.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
      // debugPrint('Error creating user: $e');
    }

    return kartUpdateModel;
  }

  Future<AddToKartModel?> addToKartApi(
      {required storeProductId,required storeId,barcode,quantity,required authToken}) async {
    AddToKartModel? addToKartModel;
    var inputData = {"storeProductId": storeProductId,"storeId":storeId,"barcode" :barcode,"quantity":quantity};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/addProductToCart",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        addToKartModel = AddToKartModel.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
      // debugPrint('Error creating user: $e');
    }

    return addToKartModel;
  }

  Future<AddToKartModel?> removeToKartApi(
      {required cartId,required authToken}) async {
    AddToKartModel? addToKartModel;
    var inputData = {"cartId": cartId};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/removeProductToCart",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        addToKartModel = AddToKartModel.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
      // debugPrint('Error creating user: $e');
    }

    return addToKartModel;
  }

  Future<KartCount?> getKartCountApi(
      {required authToken}) async {
    KartCount? kartCount;
    var inputData = {"cartId": ""};
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getUserCartCount",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        kartCount = KartCount.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
      // debugPrint('Error creating user: $e');
    }

    return kartCount;
  }
  Future<CommonResponseModel?> proceedToPayApi(
      {required authToken,storeId}) async {
    CommonResponseModel? commonResponseModel;
    var inputData = {"storeId": storeId};
    debugPrint('inputData: $inputData');
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/generatePaymentToken",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {

        debugPrint('outPut: ${response.data}');
      }
      try {
        commonResponseModel = CommonResponseModel.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
      // debugPrint('Error creating user: $e');
    }

    return commonResponseModel;
  }
  Future<CreateOrder?> createOrderApi(
      {required authToken,couponApplied,couponCode,paymentMethod}) async {
    CreateOrder? createOrder;
    var inputData = {"couponApplied": couponApplied,"couponCode":couponCode,"paymentMethod":paymentMethod};
    FormData formData = FormData.fromMap(inputData);
    print("order create ==={$inputData}");
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/createOrder",
          data: formData,
          options:Common.getOptions(authToken)
      );
      if (kDebugMode) {
        debugPrint('inputData: $inputData');
        debugPrint('outPut: ${response.data}');
      }
      try {
        createOrder = CreateOrder.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
      // debugPrint('Error creating user: $e');
    }

    return createOrder;
  }

  Future<PaymentTokenModel?> createPaymentTokenApi(
      {required orderCurrency,orderAmount,orderId}) async {
    PaymentTokenModel? paymentTokenModel;
    var inputData = {"orderId": orderId,"orderAmount":orderAmount,"orderCurrency":orderCurrency};
    //debugPrint('inputData:$inputData');

    try {
      Response response = await client.post(
          "https://test.cashfree.com/api/v2/cftoken/order",
        data: inputData,
        options: Options(
              headers: {"x-client-id": "2383135b2159738f9f5fe49ab9313832", "x-client-secret": "TESTe72e4e9141fde2b7a7daa714c68a5605bce3aa34"}),
      );
      if (kDebugMode) {

        debugPrint('outPut: ${response.data}');
      }
      try {
        paymentTokenModel = PaymentTokenModel.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
       debugPrint('Error creating user: $e');
    }

    return paymentTokenModel;
  }
  // Future<CommonResponseModel?> createPaymentApi(
  //     {required authToken,orderId,paymentId,signatureHash,responseJson,amount,paymentStatus}) async {
  //   CommonResponseModel? commonResponseModel;
  //   var inputData = {"orderId": orderId,"transactionId":paymentId,"signatureHash":signatureHash,"responseJson":responseJson,"amount":amount,"paymentStatus":paymentStatus};
  //   FormData formData = FormData.fromMap(inputData);
  //
  //   debugPrint('inputData: $inputData');
  //
  //   try {
  //     Response response = await client.post(
  //         "${Constant.baseUrl}/payment",
  //         data: formData,
  //         options:Common.getOptions(authToken)
  //     );
  //     if (kDebugMode) {
  //       debugPrint('outPut: ${response.data}');
  //     }
  //     try {
  //       commonResponseModel = CommonResponseModel.fromJson(response.data);
  //     } catch (e) {
  //
  //       debugPrint(e.toString());
  //     }
  //   } catch (e) {
  //     // debugPrint('Error creating user: $e');
  //   }
  //
  //   return commonResponseModel;
  // }

  Future<CommonResponseModel?> createPaymentApi(

      {required authToken,orderId,paymentId,signatureHash,responseJson,amount,paymentStatus}) async {

    CommonResponseModel? commonResponseModel;

    var inputData = {"orderId": orderId,"transactionId":paymentId,"signatureHash":signatureHash,"responseJson":responseJson,"amount":amount,"paymentStatus":paymentStatus};

    FormData formData = FormData.fromMap(inputData);


    debugPrint('inputData: $inputData');



      try {

        Response response = await client.post(

          "${Constant.baseUrl}/payment",

          data: formData,

          options:Common.getOptions(authToken)

       );

        if (kDebugMode) {

          debugPrint('outPut: ${response.data}');

        }

        try {

          commonResponseModel = CommonResponseModel.fromJson(response.data);

        } catch (e) {



          debugPrint(e.toString());

        }

      } catch (e) {

        // debugPrint('Error creating user: $e');

      }



      return commonResponseModel;

    }

  Future<CouponModel?> getCouponApi(

      {required authToken}) async {

    CouponModel? couponModel;
    var inputData = {"cartId": ""};
    FormData formData = FormData.fromMap(inputData);
    debugPrint('inputData: $inputData');
    try {
      Response response = await client.post(
          "${Constant.baseUrl}/getCoupons",
          data: formData,
          options:Common.getOptions(authToken)
      );

        debugPrint('outPut: ${response.data}');

      try {
        couponModel = CouponModel.fromJson(response.data);
      } catch (e) {

        debugPrint(e.toString());
      }
    } catch (e) {
      // debugPrint('Error creating user: $e');
    }

    return couponModel;
  }


  ///For Delivery Address
  Future<AddDeliveryAddressModel?> addDeliveryAddress(
      { required authToken,
        required name,
        required mobile,
        required pin_code,
        required address,
        required town_locality,
        required city,
        required state,
        required save_as,
        required openOnSunday,
        required openOnSaturday}) async {
    AddDeliveryAddressModel? retrievedUser;
    var inputData = {
      "name": name,
      "mobile": mobile,
      "pin_code": pin_code,
      "address": address,
      "town": town_locality,
      "city": city,
      "state": state,
      "save_as": save_as,
      "sunday": openOnSunday,
      "saturday": openOnSaturday,

    };
    FormData formData = FormData.fromMap(inputData);
    try {
      Response response = await client.post(
        "${Constant.baseUrl}/deliveryAddress",
        data: formData,
          options: Common.getOptions(authToken)
      );
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        retrievedUser = AddDeliveryAddressModel.fromJson(response.data);
      } catch (e) {
         print(e.toString());
      }
    } catch (e) {
       print('Error creating user: $e');
    }

    return retrievedUser;
  }




  // Future<PaymentModel?> getPaymentComplete() async{
  //   PaymentModel paymentModel;
  //   var inputData = {"cartId": ""};
  //   FormData formData = FormData.fromMap(inputData);
  //   try {
  //     Response response = await client.post(
  //         "${Constant.baseUrl}/payment",
  //         data: formData,
  //
  //     );
  //
  //     debugPrint('outPut: ${response.data}');
  //
  //     try {
  //       paymentModel = PaymentModel.fromJson(response.data);
  //     } catch (e) {
  //
  //       debugPrint(e.toString());
  //     }
  //   } catch (e) {
  //     // debugPrint('Error creating user: $e');
  //   }
  //
  //   return  PaymentModel();
  //
  // }

  }

