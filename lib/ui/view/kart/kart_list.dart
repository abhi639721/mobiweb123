import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/kart/KartController.dart';

import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/not_found/cart_not_found.dart';
import '../../../constants/Constant.dart';
import '../../../custom_utils/customutils.dart';
import '../base/page.dart';
import '../dialog/loader.dart';
import '../product/order/paymentview.dart';
import 'kart_card.dart';
class KartPage extends AppPageWithAppBar {
  static String routeName = "/kartPage";
  final kartController = Get.put(KartController());
  static Future<bool?> start<bool>(String storeId) {
    return navigateTo<bool>(routeName, currentPageTitle: "Cart ",arguments: {"storeId":storeId});
  }
  @override
  Widget get body {
    kartController.callKartListApi();
    RxInt totalKartPrice = Constant.totalKartPrice.obs;

    return Obx(() => (kartController.isLoader.value)
        ? const Loader()
        :  kartController.kartList.isEmpty?CartNotFound():Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
            child: Stack(
              children: [
                kartController.kartList.isEmpty?CartNotFound():createCartList,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: size_70,
                      child: footer(totalKartPrice)),
                ),
              ],
            ),
          ));
  }

  Widget get createCartList {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: ListView.builder(
        physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, position) {
          return KartCard(
            kartCard: kartController.kartList[position],
            kartController: kartController,
            position: position,
          );
        },
        itemCount: kartController.kartList.length,
      ),
    );
  }




  createCartListItem(int position) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 12, right: 16, top: 12),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  productImage(position),
                  Expanded(
                    flex: 100,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          productName(position),
                          Utils.getSizedBox(height: size_12),
                          // const Text(
                          //   "gdhghjdsgfhjgdhg",
                          //   style: TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.w600),
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              productPrice(position),
                              quantity(position),

                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget productImage(position){
    return  Container(
      margin: const EdgeInsets.only(
          right: 8, left: 8, top: 8, bottom: 8),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        color: Colors.blue.shade200,
      ),
      child:
      Image.network(kartController.kartList[position].image),
    );
  }


  Widget  productName (position){
    return  Text(
      kartController.kartList[position].itemName,
      maxLines: 2,
      softWrap: true,
      style:  TextStyle(
        color: MyColors.kColorBlack,
          fontSize: size_14, fontWeight: FontWeight.w600),
    );
  }
  Widget  productPrice( position){
    return  Text(
      "${kartController.kartList[position].price}",
      style: const TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.green),
    );
  }

  Widget quantity(int position){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.remove,
            size: 24,
            color: Colors.grey.shade700,
          ),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.only(
                bottom: 2, right: 12, left: 12),
            child: Text(
              kartController
                  .kartList[position].quantity
                  .toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.w600),
            ),
          ),
          Icon(
            Icons.add,
            size: 24,
            color: Colors.grey.shade700,
          )
        ],
      ),
    );
  }

  Widget footer(RxInt totalPrice) {
    return Container(

      color: MyColors.kColorWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.backgroundLBlueColor,
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "Total Amount",
                          textAlign: TextAlign.start,
                          style:  TextStyle(fontSize: size_10, color:MyColors.kColorBlack,fontWeight: FontWeight.w400),
                        ),

                        Text(
                              " ${kartController.totalPrice.value}", style:  TextStyle(
                          fontWeight: FontWeight.w500,
                          color: MyColors.kColorGreen,
                          fontSize: size_18,
                            ),
                            ),

                      ],
                    ),
                  )),
                ),
                // const Text(
                //   "Saved Rs 5.00",
                //   style: const TextStyle(
                //       fontWeight: FontWeight.w500,
                //       color: Colors.black,
                //       fontSize: 12
                //   ),
                // ),
              ],
            ),
            checkOutButton
          ],
        ),
      ),
    );
  }

  Widget get checkOutButton {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          textStyle: const TextStyle(

              color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 15)),
      onPressed: () {
          PaymentoptionsView.start(arguments['storeId']);
        },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
        child:  Text('Check Out',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
