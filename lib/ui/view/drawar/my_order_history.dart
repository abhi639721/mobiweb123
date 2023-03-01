import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/order/order_history_controller.dart';
import 'package:jump_q/models/order/OrderData.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/text_style.dart';
import 'package:jump_q/ui/view/dialog/loader.dart';
import 'package:jump_q/ui/view/home/tab/orderHistory/order_Summary.dart';
import 'package:jump_q/ui/widget/dash.dart';
import 'package:jump_q/utils/palette.dart';

class MyOrderHistory extends StatefulWidget {
  const MyOrderHistory({Key? key}) : super(key: key);
  @override
  _MyOrderHistoryState createState() => _MyOrderHistoryState();

  static String routeName = "/myOrderHistory";
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName,
        currentPageTitle: "MyOrderHistory");
  }
}

class _MyOrderHistoryState extends State<MyOrderHistory> {
  final orderHistoryController = Get.put(OrderHistoryController());
  @override
  Widget build(BuildContext context) {
    orderHistoryController.callOrderHistoryApi();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.kColorWhite,
        foregroundColor: MyColors.statusBarColor,
        title: const Text('My Order History'),
      ),
      body: Obx(
              () => (orderHistoryController.isLoader.value)
              ? const Loader()
              :
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: orderList(orderHistoryController, context)
            ),
          )
      ),
    );
  }
}
Widget orderList(
    OrderHistoryController orderHistoryController, BuildContext context) {
  return ListView.builder(
      itemCount: orderHistoryController.orderList.length,
      // padding: const EdgeInsets.only(top: 10.0),
      itemBuilder: (context, index) {
        return  historyCard(
            orderHistoryController.orderList[index], context);
      });
}

Widget  historyCard (OrderData data,  BuildContext context){
  double width = MediaQuery.of(context).size.width*0.8;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Container(

            width: width,
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // border: Border.all(color: Colors.grey)
            ),
            child: Column( mainAxisSize: MainAxisSize.max, children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    storeImage(data),

                    storeName(data),

                  ],
                ),
              ),
              const Divider(
                color: Colors.black45,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    billNumber(data),
                    viewMore(data.orderId),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const MyDashDivider(color: Colors.grey),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dateAndTime(data),
                    totalAmount(data),
                  ],
                ),
              ),
              const SizedBox(height: 5,)
            ],
            ))),
  );
}
Widget storeImage(OrderData data){
  return  ClipRRect(
    borderRadius:
    const BorderRadius.all(Radius.circular(10)),
    child: FadeInImage.assetNetwork(
      placeholder: 'assets/png/app_logo.png',
      image: data.storeImage,
      fit: BoxFit.cover,
      width: 60,
      height: 60,
    ),);
}
Widget storeName (OrderData data){

  return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( data.storeName,
                style:  TextStyles.headingText()),
            const SizedBox(height: 5,),
            Text(
              data.storeAddress,
              maxLines: 3,
              // overflow: TextOverflow.ellipsis,
              //softWrap: false,
              //overflow: TextOverflow.,

              // textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w100, color: Colors.black87,fontSize: 12),
            ),
          ],),
      )
  );
}
Widget storeaddress (OrderData data){
  return  Flexible(
    child: Text(
      data.storeAddress,
      overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: const TextStyle(
          fontWeight: FontWeight.w100, color: Colors.black87,fontSize: 12),
    ),
  );
}


Widget  billNumber (OrderData data) {
  return RichText(
      text:  TextSpan(
          text: 'Order Number\n',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
          children: [
            TextSpan(
                text: data.orderNo,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ))
          ]));
}

Widget dateAndTime (OrderData data){
  return  Row(
    children: [
      Text(
        data.orderedDate ,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
      ),
      const Text(" at ",style: TextStyle(fontWeight: FontWeight.bold),),
      Text(
        data.orderedTime,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
      ),

    ],
  );
}

Widget totalAmount (OrderData data ){
  return RichText(
      text:  TextSpan(
          text: data.paymentStatus ? " Paid " : " Pending ",
          style:
          TextStyle(color: MyColors.kColorGreenDark, fontWeight: FontWeight.bold,fontSize: 13),
          children: [
            TextSpan(
              text: '₹${data.totalAmount}' ,
              style: TextStyle(
                  color:  data.paymentStatus ? MyColors.kColorGreen : MyColors.kColorOrange, fontWeight: FontWeight.bold),)
          ]));

}

Widget  viewMore(String orderId) {
  return Padding(
    padding: const EdgeInsets.only(right: 5),
    child: InkWell(
      //borderRadius: BorderRadius.all(Radius.circular(100)),
      hoverColor: MyColors.statusBarColor,
      child: const Text(
        "View Details>",
        style: TextStyle(color: Palette.appColor,fontSize: 12),
      ),
      onTap: () {

        OrderSummary.start(orderId);
      },
    ),
  );
}
