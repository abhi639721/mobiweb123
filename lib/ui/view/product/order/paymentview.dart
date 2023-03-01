import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/product/order/delivary_radio_button.dart';
import 'package:jump_q/ui/view/product/order/get_coupons_card.dart';
import 'package:jump_q/ui/view/product/order/radio_button.dart';
import '../../../../controllers/kart/KartController.dart';
import '../../../../notifire/kart_notifire.dart';
import '../../../../services/navigator.dart';
import '../../../../theme/my_theme.dart';

class PaymentoptionsView extends AppPageWithAppBar {
  static String routeName = "/PaymentOptionsView";

  PaymentoptionsView({Key? key}) : super(key: key);

  static Future<bool?> start<bool>(String storeId) {
    return navigateTo<bool>(routeName,
        currentPageTitle: "Payment", arguments: {'storeId': storeId});
  }

  final kartController = Get.put(KartController());

  final NotificationNotifer notifierController =
      Get.find<NotificationNotifer>();

  @override
  Widget get body {
    return Scaffold(
      backgroundColor: MyColors.backgroundLBlueColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(height: 8,),
                //Delivery Radio Button
                 const DeliveryButton(),
                 SizedBox(
                  height: size_8,
                ),

                Container(
                  color: MyColors.kColorWhite,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 14, top: 12),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Payment Options',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                      ),
                      RadioButton(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: size_8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: size_5),
                      decoration: BoxDecoration(
                          color: MyColors.kColorWhite,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                      child: giftCoupons),
                ),
                 SizedBox(
                  height: size_8,
                ),
                Container(
                  color: MyColors.kColorWhite,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Price Detail")),
                        const Divider(),
                        noOfItems,
                        const SizedBox(
                          height: 8,
                        ),
                        subTotal,
                        const SizedBox(
                          height: 8,
                        ),
                        getGiftCoupon,
                        const Divider(),
                        grandTotal,
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                securityIcon,
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          footer,
        ],
      ),

    );
  }



  Widget get footer {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: MyColors.kColorWhite,
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              footerTotal,
              processToPayButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget get footerTotal {
    final kartController = Get.put(KartController());
    final total = kartController.totalPaidPrice;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
       // height: size_50,
        child:Container(
          decoration: BoxDecoration(
              color: MyColors.backgroundLBlueColor,
              border: Border.all(width: 0.1),
              borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
            child: Row(
              children: [
                Text(
                  "Total Amount ",
                  textAlign: TextAlign.start,
                  style:  TextStyle(fontSize: size_10, color:MyColors.kColorBlack,fontWeight: FontWeight.w400),
                ),

                Obx(() =>Text(
                 total.toString(), style:  TextStyle(
                  fontWeight: FontWeight.w500,
                  color: MyColors.kColorGreen,
                  fontSize: size_18,
                ),
                )),

              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget get giftCoupons {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.discount_outlined),
              ),
              // SizedBox(width: 8,),
              Text("Use Coupons"),
            ],
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () {
        CouponPage.start();
      },
    );
  }

  Widget get noOfItems {
    // final kartController = Get.put(KartController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total items'),
        Text(kartController.kartList.isNotEmpty
            ? kartController.kartList.length.toString()
            : "0")
      ],
    );
  }

  Widget get subTotal {
    final kartController = Get.put(KartController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total Amount'),
        Text(
          ' ${kartController.totalPrice.value}',
        )
      ],
    );
  }

  Widget get getGiftCoupon {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Get Coupon'),
         SizedBox(
          width: size_5,
        ),
        Obx(() => Text(
              '- ${kartController.discountCountPrice.value}',
              style: TextStyle(color: MyColors.kColorGreen),
            )),
      ],
    );
  }

  Widget get grandTotal {
    final kartController = Get.put(KartController());
          final total = kartController.totalPaidPrice;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Paid Amount',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Obx(() => Text(
              total.toString(),
              style: TextStyle(
                  color: MyColors.kColorBlue, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget get securityIcon {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageIcon(
            const AssetImage("assets/png/original.png"),
            color: MyColors.backgroundColor,
            size: 45,
          ),
          ImageIcon(
            const AssetImage(
              "assets/png/security.png",
            ),
            color: MyColors.backgroundColor,
            size: 45,
          ),
          ImageIcon(
            const AssetImage("assets/png/cos.png"),
            color: MyColors.backgroundColor,
            size: 45,
          ),
        ],
      ),
    );
  }

  // Widget get viewPriceDatails {
  //   return InkWell(child: Text("View Price Details",textAlign:TextAlign.start,style: TextStyle(fontSize: 12,color: MyColors.kColorBlue),));
  //
  // }
  Widget get processToPayButton {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          textStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 15)),
      onPressed: () {
        kartController.callCreateOrderApi(paymentType: "COC");

      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Text(
          'Proceed to Pay',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

