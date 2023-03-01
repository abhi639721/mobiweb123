import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/kart/KartController.dart';
import 'package:jump_q/models/product/ProductData.dart';
import 'package:jump_q/notifire/kart_notifire.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/base/base_satateless_widget.dart';
import 'package:jump_q/ui/view/product/product_detail.dart';
import '../../../data/preferences/AppPreferences.dart';
import '../loginandsignup/login_page.dart';

class WishCard extends BaseStateLessWidget {
  final NotificationNotifer notifierController = Get.find<NotificationNotifer>();
  final appPreferences = Get.find<AppPreferences>();
  final controller  =Get.put(KartController());
  WishCard({Key? key,required  this.product}) : super(key: key);
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      ProductDetail.start(product);
      },child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ),
              productName(product.productName),
              const SizedBox(height: 5,),
              priceAndDiscountPrice,
              const SizedBox(height: 5,),
              product.status?addButton:outOfStock(product.stock),
            ],
          ),
        ],
      ),
    ),);
  }
  Widget  outOfStock(String outOfStock){
    return Center(child: Padding(padding: EdgeInsets.only(bottom: 5),child: Text(outOfStock,
        maxLines: 1,
        style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w100)),),);
  }
  Widget  get addButton {
    return InkWell(onTap: (){ if (appPreferences.isLoggedIn) {
      controller.callAddToKartApi(
          storeProductId: product.storeProductId,
          storeId: product.storeId);
    } else {
      LogInScreen.start();
    }},child: Container(
      height: 45,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0))),
      child: const Center(child: Text("Add to card",style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
    ),);
  }
  Widget get priceAndDiscountPrice{
    return Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Row(
      children: [
        Text("${product.salePrice}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 5,),
        Text("${product.productPrice}"
         ,
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
            color: MyColors.kColorDarkGrey,

            fontSize: 12,
          ),
        ),
      ],
    ),);
  }
  Widget  productName(String productName){
    return Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Text(
      productName,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),);
  }

}
