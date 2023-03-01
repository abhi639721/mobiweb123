import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/order/order_history_controller.dart';
import 'package:jump_q/models/order/OrderHistoryData.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/dialog/loader.dart';
import '../../../../../data/preferences/AppPreferences.dart';
import '../../../../../services/navigator.dart';
import '../../../../../theme/my_theme.dart';
import '../../../../../utils/palette.dart';
import '../../../../widget/dash.dart';
import 'invoice/invoice_data.dart';
import 'invoice/invoice_services.dart';

class OrderSummary extends AppPageWithAppBar {
  static String routeName = "/orderHistoryDetails";

  OrderSummary({Key? key}) : super(key: key);
  static Future<bool?> start<bool>(String oderId) {
    return navigateTo<bool>(routeName, currentPageTitle: "Order Details",arguments: {"oderId":oderId});
  }
  final appPreferences = Get.find<AppPreferences>();
  final orderHistoryController = Get.put(OrderHistoryController());


  @override
  Widget  get body {
   orderHistoryController.callOrderHistoryDetailApi(arguments["oderId"]) ;
    return Obx(() => orderHistoryController.isLoaderDetail.value?const Loader():SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Palette.colorTextBlack,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            mallsNameAddress(orderHistoryController),
            const SizedBox(
              height: 10,
            ),
            downloadButton(orderHistoryController,  appPreferences),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const Text(
              "These items was purchase",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Total items",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
           //const Divider(),
            const SizedBox(
              height: 8,
            ),
            listView(orderHistoryController),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            itemTotal(orderHistoryController),
            const SizedBox(
              height: 8,
            ),
            subTotal(orderHistoryController),
            const SizedBox(
              height: 8,
            ),

            coupon(orderHistoryController),
            const SizedBox(
              height: 8,
            ),

            const MyDashDivider(color: Colors.black12),
            const SizedBox(
              height: 8,
            ),
            grandTotal(orderHistoryController),
            const Divider(),
            yourTotalSavings(orderHistoryController),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Payments details",
              style:  TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(),
            billNumber(orderHistoryController),
            const Divider(),
            payment(orderHistoryController),
            const Divider(),
            dateAndTime(orderHistoryController),
            const Divider(),
            phoneNumber(orderHistoryController),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    ));
  }
}
Widget  listView(OrderHistoryController orderHistoryController){
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: orderHistoryController.orderHistoryDetailModel.orderHistoryData!.length,
    itemBuilder: (BuildContext context, int index) {
      return listViewCard(orderHistoryController.orderHistoryDetailModel.orderHistoryData![index]);
    },
  );

}
Widget  listViewCard(OrderHistoryData data){
  return Column(crossAxisAlignment:CrossAxisAlignment.start,
    children: [
    const Divider(height: 2,color: Palette.appColor,),

    const SizedBox(
      height: 8,
    ),
    itemName(data.productName),

   /* quantity,*/
    const SizedBox(
      height: 6,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              data.quantity.toString(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 3,
            ),
            const Text(
              "×",
              style:
              TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
             Text(
              data.productPrice,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
         Text(
          data.total,
          style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  ],);
}
// Widget get quantity {
//   return const Text("Quantity : 200mg",
//       style: TextStyle(
//         color: Colors.black87,
//         fontSize: 12,
//       ));
// }

Widget  itemName(String productName) {
  return  Text(productName,
      style: const TextStyle(
          color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold));
}
Widget  subTotal(OrderHistoryController orderHistoryController) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:  [
       const Text(
        "Total Amount",
        style: TextStyle(
          color: Colors.black87, fontSize: 14, ),
      ),
      Text(
       '  ${orderHistoryController.orderHistoryDetailModel.grandTotal}',
        style: const TextStyle(
          color: Colors.black87, fontSize: 14, ),
      )
    ],
  );
}

Widget  itemTotal(OrderHistoryController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:  [
      const Text(
        "Total Item",
        style:  TextStyle(
            color: Colors.black87, fontSize: 14, ),
      ),
      Text(
        controller.orderHistoryDetailModel.totalItems.toString(),
        style: const TextStyle(
            color: Colors.black87, fontSize: 14, ),
      )
    ],
  );
}

Widget  mallsNameAddress(OrderHistoryController orderHistoryController) {
  return RichText(
      text:  TextSpan(
          text: '${orderHistoryController.orderHistoryDetailModel.storeName}\n',
          style:  const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          children: [
        TextSpan(
            text:
                orderHistoryController.orderHistoryDetailModel.storeImage,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ))
      ]));
}

Widget  billNumber(OrderHistoryController controller) {
  return RichText(
      text:  TextSpan(
          text: 'Bill Number\n',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
          children: [
        TextSpan(
            text: controller.orderHistoryDetailModel.orderNo,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ))
      ]));
}

Widget  payment(OrderHistoryController controller) {
  return RichText(
      text:   TextSpan(
          text: 'Payment\n',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
          children: [
        TextSpan(
            text: 'Paid by : ${controller.orderHistoryDetailModel.paymentType}',
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ))
      ]));
}

Widget  dateAndTime(OrderHistoryController controller) {
  return RichText(
      text:  TextSpan(
          text: 'Date & Time\n',
          style:  const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
          children: [
        TextSpan(
            text:  controller.orderHistoryDetailModel.orderedDate,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ))
      ]));
}

Widget  phoneNumber(OrderHistoryController controller) {
  return RichText(
      text:  TextSpan(
          text: 'Phone Number\n',
          style:  const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
          children: [
        TextSpan(
            text: controller.orderHistoryDetailModel.mobile,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ))
      ]));
}

Widget  yourTotalSavings(OrderHistoryController controller) {
  return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: MyColors.kColorBlue),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          const Text(
            "Your total savings",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          Text(
            controller.orderHistoryDetailModel.discount.toString(),
            style: const TextStyle(fontSize: 12, color: Colors.black),
          )
        ],
      ));
}

Widget  grandTotal(OrderHistoryController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:  [
      const Text(
        'Paid Amount',
        style:  TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Text(
        '  ${controller.orderHistoryDetailModel.paidAmount.toString()}' ,
        style: const TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget get gst {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Text(
        'GST',
        style: TextStyle(fontSize: 14, color: Colors.black87),
      ),
      Text('+ 23', style: TextStyle(fontSize: 14, color: Colors.black87)),
    ],
  );
}

Widget  coupon(OrderHistoryController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:  [
       const Text(
        'Get discount',
        style: TextStyle(
          fontSize: 14,
          color: Colors.blueAccent,
        ),
      ),
      Text('You saved -  ${controller.orderHistoryDetailModel.discount}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blueAccent,
          ))
    ],
  );
}

Widget   downloadButton(OrderHistoryController controller,AppPreferences appPreferences) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: size_160,
        height: size_25,
        child: OutlinedButton(
            onPressed:  () async{
              final pdfFile = await PdfInvoiceData.generate(appPreferences.userName,appPreferences.email);
              // opening the pdf file
              FileHandlePDF.openFile(pdfFile);
            },
            style: OutlinedButton.styleFrom(
                // side: BorderSide(width: 1.0, color: Colors.grey),
                ),
            child: Row(
              children: const [
                Icon(Icons.sim_card_download_outlined, size: 15),
                Text(
                  " Download Summary",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            )),
      ),
      SizedBox(
        width: size_160,
        height: size_25,
        child: OutlinedButton(
            onPressed: () async{
              final pdfFile = await PdfInvoiceData.generate(appPreferences.userName,appPreferences.email);
              // opening the pdf file
              FileHandlePDF.openFile(pdfFile);
            },
            style: OutlinedButton.styleFrom(
                // side: BorderSide(width: 1.0, color: Colors.grey),
                ),
            child: Row(
              children: const [
                Icon(
                    Icons.sim_card_download_outlined, size: 15),
                Text(
                  " Download Invoice",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            )
        ),
      ),
    ],
  );
}
