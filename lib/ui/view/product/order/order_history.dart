// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:jump_q/controllers/order/order_history_controller.dart';
// import 'package:jump_q/models/order/OrderData.dart';
// import 'package:jump_q/theme/my_theme.dart';
// import 'package:jump_q/ui/view/base/page.dart';
// import '../../../../services/navigator.dart';
// import '../../dialog/loader.dart';
//
// class OrderHistory extends AppPageWithAppBar {
//   static String routeName = "/orderHistoryList";
//   final controller = Get.put(OrderHistoryController());
//   static Future<bool?> start<bool>() {
//     return navigateTo<bool>(
//       routeName,
//       currentPageTitle: "Order history",
//     );
//   }
//
//   @override
//   Widget get body {
//     controller.callOrderHistoryApi();
//
//     return Obx(() => (controller.isLoader.value)
//         ? const Loader()
//         : Padding(
//             padding:
//                 const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
//             child: createCartList,
//           ));
//   }
//
//   Widget get createCartList {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 100),
//       child: ListView.builder(
//         shrinkWrap: true,
//         primary: false,
//         itemBuilder: (context, position) {
//           return cardUi(controller.orderList[position]);
//         },
//         itemCount: controller.orderList.length,
//       ),
//     );
//   }
//
//   Widget cardUi(OrderData data) {
//     return Card(
//       elevation: 5,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [orderNumber(data), orderDate(data)],
//           ),
//           SizedBox(height: size_20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [storeName(data), totalAmount(data)],
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget orderNumber(data){
//     return Text(data.orderNo);
//   }
//   Widget orderDate(data){
//     return Text(data.orderedDate);
//   }
//   Widget storeName(data){
//     return Text(data.storeName);
//   }
//   Widget totalAmount(data){
//     return Text(data.totalAmount.toString());
//   }
// }
