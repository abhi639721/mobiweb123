import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/wish/wish_controller.dart';
import 'package:jump_q/ui/view/commonwidget/not_found/store_wishlist_not_found.dart';
import 'package:jump_q/ui/view/wish/store_card.dart';
import '../dialog/loader.dart';
class StoreWishList extends StatefulWidget {
  const StoreWishList({Key? key}) : super(key: key);
  @override
  _StoreWishListState createState() => _StoreWishListState();
}
class _StoreWishListState extends State<StoreWishList> {
  final controller = Get.put(WishListController());
  @override
  Widget build(BuildContext context) {
    controller.callStoreWishListApi();
    return Obx(
          () => controller.isStoreLoader.value
          ? const Loader()
          : controller.storeList.isEmpty ? StoreNotFound() : ListView.builder(
            physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
              itemCount: controller.storeList.length,
              itemBuilder: (context, int index) {
                return SuperMarketCard(
                    storeData: controller.storeList[index]);
              }),
    );
  }
}


