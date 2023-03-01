import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/models/product/ProductData.dart';
import 'package:jump_q/ui/view/commonwidget/text_style.dart';
import 'package:jump_q/utils/palette.dart';
import '../../../controllers/home/store_detail_controller.dart';
import '../../../controllers/kart/KartController.dart';
import '../../../notifire/kart_notifire.dart';
import '../../../theme/my_theme.dart';
import '../commonwidget/primary_elevated_button.dart';

class BottomSheetBar extends StatelessWidget {
  final NotificationNotifer notifierController =
      Get.find<NotificationNotifer>();
  final storeDetailController = Get.put(StoreDetailController());

  RxInt quantity = 1.obs;

  //final ProductData product;

  BottomSheetBar(
      {Key? key,
      required this.kartController,
      required this.barcode,
      required this.productData})
      : super(key: key);
  final String barcode;
  final ProductData productData;

  final KartController kartController;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xff757575),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        //const Color(0xff757575),


        //const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              productImage,
              const SizedBox(
                height: 15,
              ),
              productName,
              const SizedBox(
                height: 8,
              ),
              productDescription,
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  productWeight,
                  priceAndDiscountPrice,
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5),
                      minusButton,
                      const SizedBox(width: 10),
                      productQuantity,
                      const SizedBox(
                        width: 10,
                      ),
                      addButton,
                    ],
                  ),
                  addToKartButton,
                ],
              ),
              Divider(),
            ],
          ),
        ));
  }

  Widget get productImage {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Image.network(
          productData.image,
          height: 200,
        ));
  }

  Widget get productName {
    return Text(
      productData.productName,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
        color: Colors.black,
      ),
    );
  }

  Widget get productWeight{
    return Text.rich(
      TextSpan(

        children: [
          TextSpan(
              text: 'Weight :',
              style: TextStyle(fontSize: size_10, color: MyColors.colorTextGrey)),
          TextSpan(
              text: productData.weight,
              style:  TextStyle( color: MyColors.appColor,fontSize: size_12,fontWeight: FontWeight.bold
              )),
        ],
      ),
    );


      // Text(
      //     "${productData.weight} ",
      //     style: TextStyle(
      //         color: MyColors.appColor,fontSize: size_12,fontWeight: FontWeight.bold
      //     )
      // );
  }
  Widget get priceAndDiscountPrice {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Text(
              "${productData.salePrice} ",
              style: TextStyle(
                color: MyColors.appColor,

                fontSize: size_15,
                fontWeight: FontWeight.bold
              )
          ),

          Text(
            "${productData.productPrice}",
            style:  TextStyle(
              decoration: TextDecoration.lineThrough,
              color: MyColors.colorTextGrey,
              fontSize: size_12,
            ),
          ),
        ],
      ),
    );
  }


  Widget get productDescription {
    return Text(
      productData.productDescription,
      maxLines: 2,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 15.0,
        color: Colors.grey,
      ),
    );
  }

  Widget get productQuantity {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.only(bottom: 5, top: 5, right: 12, left: 12),
        child: Obx(() => Text(
              "${quantity.value}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )),
      ),
    );
  }

  Widget get productNotFound {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 100),
        child: Text(
          "Product Not Founded",
          style: TextStyles.headingText(color: Palette.colorPrimaryDark),
        ),
      ),
    );
  }

  Widget get quantityTextField {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.only(bottom: 5, top: 5, right: 12, left: 12),
      child: Obx(() => Text(
            "${quantity.value}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          )),
    );
  }

  Widget get addButton {
    return Material(
        color: MyColors.kColorLightWhite,
        borderRadius: BorderRadius.circular(10),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.green,
          ),
          color: Colors.white,
          onPressed: () {
            if (quantity.value >= 0) {
              quantity.value++;
            }
          },
        ));
  }

  Widget get minusButton {
    return Material(
        color: MyColors.kColorLightWhite,
        borderRadius: BorderRadius.circular(10),
        child: IconButton(
          icon: const Icon(Icons.remove, color: Colors.red),
          color: Colors.white,
          onPressed: () {
            if (quantity.value > 0) {
              quantity.value--;
            }
          },
        ));
  }

  Widget get addToKartButton {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: 150,
        height: 45,
        child: PrimaryElevatedBtn(
            "Add to cart",
            () => kartController.callAddToKartApi(
                storeProductId: productData.storeProductId,
                storeId: productData.storeId,
                barcode: barcode,
                quantity: quantity),
            borderRadius: 25.0),
      ),
    );
  }

  void dispose() {
    kartController.dispose();
  }
}
