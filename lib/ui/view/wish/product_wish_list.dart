import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jump_q/controllers/wish/wish_controller.dart';
import 'package:jump_q/ui/view/commonwidget/not_found/wishlist_not_found.dart';
import 'package:jump_q/ui/view/wish/wish_card.dart';

import '../dialog/loader.dart';

class WishList extends StatefulWidget {
  WishList({Key? key}) : super(key: key);
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final controller = Get.put(WishListController());
  @override
  Widget build(BuildContext context) {
    controller.callWishListApi();
    return Obx(() => controller.isLoader.value
        ? const Loader()
        : controller.productDataList.isEmpty?ProductNotFound():Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: gridviewWidget(controller),
        ),
      ],
    ));
  }
}
Widget  gridviewWidget(WishListController controller){
  return Center(
    child: GridView.builder(
      physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: controller.productDataList.length,
      itemBuilder: (ctx, i) {
        return WishCard(product:
        controller.productDataList[i]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 5,
        mainAxisExtent: 264,
      ),
    ),
  );
}
Widget wishList(
    WishListController controller) {
  return ListView.builder(
      itemCount: controller.productDataList.length,
      padding: const EdgeInsets.only(top: 10.0),
      itemBuilder: (context, index) {
        return WishCard(product:
            controller.productDataList[index]);
      });
}

