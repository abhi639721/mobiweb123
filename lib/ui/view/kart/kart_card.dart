import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jump_q/models/kart/KartData.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/base/base_satateless_widget.dart';
import '../../../controllers/kart/KartController.dart';

class KartCard extends BaseStateLessWidget {
  KartCard(
      {Key? key,
      required this.kartCard,
      required this.kartController,
      required this.position})
      : super(key: key);
  final KartData kartCard;
  final KartController kartController;
  final int position;

  @override
  Widget build(BuildContext context) {
    int quantit = int.parse(kartCard.quantity);
    RxInt quantity = quantit.obs;
    int pri = int.parse(kartCard.total);
    RxInt price = pri.obs;
    return createCartListItem(quantity, price);
  }

  Widget createCartListItem(RxInt quantity, RxInt price) {
    return Card(
      elevation: 5,
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 12, right: 16, top: 12),
            decoration: const BoxDecoration(
                color: MyColors.kColorWhite,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      height: size_70,
                        width: size_70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey,width: 0.5)
                        ),
                        child: productImage),
                    Expanded(
                      flex: 100,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            productNameWDGT,
                            //Utils.getSizedBox(height: 6),
                            Row(
                               mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Obx(() => Text(
                                      "$price",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.green),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          if (quantity.value > 0) {
                                            quantity = quantity - 1;
                                            price.value = price.value -
                                                (int.parse(kartCard.price)
                                                );
                                            kartController.callKartUpdateApi(
                                                cartId: kartCard.cart_id
                                                    .toString(),
                                                quantity: quantity.value
                                                    .toString());
                                          }
                                        },
                                        child: Card(
                                            color: MyColors.kColorLightWhite,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.red,
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Container(
                                          color: Colors.grey.shade200,
                                          padding: const EdgeInsets.only(
                                              bottom: 5,
                                              top: 5,
                                              right: 12,
                                              left: 12),
                                          child: Obx(() => Text(
                                                "${quantity}",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          quantity = quantity + 1;
                                          price.value = getPrice(
                                              int.parse(kartCard.price),
                                              quantity.value);
                                          kartController.callKartUpdateApi(
                                              cartId: kartCard.cart_id,
                                              quantity:
                                                  quantity.value.toString());
                                        },
                                        child: Card(
                                            color: MyColors.kColorLightWhite,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child:  Icon(
                                              Icons.add,
                                              color: MyColors.kColorGreen,
                                            )),
                                      )
                                    ],
                                  ),
                                )
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
          Positioned(top: 0, right: 10, child: removeFromCart)
        ],
      ),
    );
  }

  Widget get productNameWDGT {
    return Container(
      padding: const EdgeInsets.only(right: 8, top: 4),
      child: Text(

        kartCard.itemName,
        maxLines: 2,
        softWrap: true,
        style: const TextStyle(fontSize: 14,color: MyColors.kColorBlack, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget get productImage {
    return Container(
      margin: const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        color: Colors.white,
      ),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/png/app_logo.png',
        image: kartCard.image,
        fit: BoxFit.cover,
        height: 40.0,
      ),
    );
  }

  Widget get removeFromCart {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          kartController.callRemoveToKartApi(
              cartId: kartCard.cart_id, position: position);
        },
        child: Icon(Icons.delete, color: Colors.red),
      ),
    );
  }

  int getPrice(int price, int quantity) {
    int totalPrice = (price * quantity);
    return totalPrice;
  }
}
