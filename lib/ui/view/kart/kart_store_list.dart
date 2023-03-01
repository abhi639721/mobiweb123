import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/commonwidget/not_found/cart_not_found.dart';
import 'package:jump_q/ui/view/kart/kart_store_card.dart';
import '../../../controllers/kart/kart_store_controller.dart';
import '../../../services/navigator.dart';
import '../dialog/loader.dart';

class KartStorePage extends AppPageWithAppBar {
  static String routeName = "/KartStorePage";
  final kartController = Get.put(KartStoreController());
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName, currentPageTitle: "Kart Detail");
  }

  @override
  Widget get body {
    kartController.callKartStoreApi();
    return Obx(() => (kartController.isLoader.value)
        ? const Loader()
        :kartController.kartStoreList.isNotEmpty?storeList:CartNotFound());
  }
  Widget get storeList {
    return SafeArea(
        child: stores);
  }
  Widget get stores{
    double height = screenHeight;
    return Container(
      height: height,

      child: ListView.builder(
          padding: const EdgeInsets.only(left: 12, right: 12,bottom: 240,),
          itemCount: kartController.kartStoreList.length,
          itemBuilder: (context, int index) {
            return KartStoreCard(
                storeData: kartController.kartStoreList[index]);
          }),
    );
  }
  }