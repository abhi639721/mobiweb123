import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/dialog/loader.dart';
import '../../../../controllers/kart/KartController.dart';
import '../../../../models/getCoupen/CoupenData.dart';
import '../../../../theme/my_theme.dart';
import '../../commonwidget/primary_elevated_button.dart';

class CouponPage extends AppPageWithAppBar {
  static String routeName = "/GetCoupons";

  CouponPage({Key? key}) : super(key: key);

  static Future<bool?> start<bool>() {
    return navigateTo<bool>(
      routeName,
      currentPageTitle: "Discount Zone",
    );
  }

  final kartController = Get.put(KartController());
  var couponDataList=<CouponData>[];

  @override
  Widget build(BuildContext context) {
    couponDataList = getCouponList(kartController.callGetCouponApi() );
    return Obx(() => kartController.isCouponLoader.value?const Loader():Scaffold(
      appBar: AppBar(
        elevation: 0,
          shadowColor: Colors.transparent,
          title: const Text(
            "Discount Coupons",
          ),
          backgroundColor: Colors.white,
          foregroundColor: MyColors.colorPrimary),
      backgroundColor: MyColors.kColorLightWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchBarBox,
              const SizedBox(
                height: 8,
              ),
              Wrap(
                  spacing: 4.0, // gap between adjacent chips
                  runSpacing: 4.0,
                  direction: Axis.horizontal,
                  children: wrapChildren(couponDataList, screenWidget,kartController)),
            ],
          ),
        ),
      ),
    ));
  }
}
List<CouponData> getCouponList(Future<List<CouponData>> list){
  List<CouponData> dataList=<CouponData>[];
  list.then((value) {
 for (var item in value) {
   dataList.add(item);
 }
  });
return dataList;
}
List<Widget> wrapChildren(List<CouponData> couponList, double width,KartController kartController) {
  List<Widget> list = <Widget>[];
  for (var item in couponList) {
    list.add(couponCard(item,kartController));
  }
  return list;
}

Widget couponCard(CouponData couponData,KartController kartController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  couponData.couponName,
                  style: const TextStyle(
                      fontSize: 14, color: MyColors.kColorBlack),
                )),
            const SizedBox(
              height: 5,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " ",
                  style: TextStyle(fontSize: 10, color: MyColors.kColorBlack),
                )),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 0.1)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(couponData.couponCode),
                    ),
                  ),
                ),
                PrimaryElevatedBtn(
                  "Apply",
                  () {
                    kartController.getCoupon.value=couponData.couponCode;
                    int  totalPrice=kartController.totalPrice.value ;
                    kartController.discountCountPrice.value=kartController.totalPrice.value~/int.parse(couponData.discount) ;
                    int discountPrice=kartController.discountCountPrice.value;
                    kartController.totalPaidPrice.value=totalPrice-discountPrice;
                    Get.back();
                  },
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget get applytext {
  return const Text("Apply");
}

Widget get searchBarBox {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 10),
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 45,
      decoration: BoxDecoration(
        color: MyColors.kColorWhite,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.0),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                fillColor: MyColors.transparent,
                filled: true,
                hintText: "Enter Coupon Code here",
                hintStyle: const TextStyle(
                  color: MyColors.kColorBlack500,
                ),
                suffix: InkWell(
                    onTap: () {},
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                          color: MyColors.colorPrimary,
                          fontWeight: FontWeight.bold),
                    )),
                //"Apply",labelStyle:TextStyle(color: MyColors.colorPrimary),
                // prefixIcon: Icon(
                //   Icons.search,
                //   color: Palette.appColor,
                // ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
