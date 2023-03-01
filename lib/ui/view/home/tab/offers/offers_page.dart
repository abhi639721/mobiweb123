import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/offers/offers_controller.dart';
import 'package:jump_q/ui/view/dialog/loader.dart';
class OffersPage extends StatefulWidget {
  const OffersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  final offersController = Get.put(OffersController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(() => offersController.isLoader.value
        ? const Loader()
        : Scaffold(
        body: SingleChildScrollView(child: Wrap(
            spacing: 4.0, // gap between adjacent chips
            runSpacing: 4.0,
            direction: Axis.horizontal,
            children: wrapChildren(width)))));
  }
List<Widget>  wrapChildren(double width){
    List<Widget> list =<Widget>[];
    for(var item in offersController.offersList){
      list.add(SizedBox(
        width: width ,
        height: 200,
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/png/app_logo.png',
          image:
          item.offerImage,
          fit: BoxFit.fill,
          width: double.maxFinite,
          height: 150.0,
        ),
      ));
    }
    return list;
}

}
