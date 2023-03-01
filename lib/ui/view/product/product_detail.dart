import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jump_q/controllers/wish/wish_controller.dart';
import 'package:jump_q/models/dashboard/Topdeal.dart';
import 'package:jump_q/models/product/ProductData.dart';

import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:unicons/unicons.dart';

import '../../../controllers/kart/KartController.dart';
import '../../../notifire/kart_notifire.dart';
import '../base/page.dart';
import '../commonwidget/kart_counter.dart';
import '../commonwidget/text_style.dart';
import '../home/tab/dashboard/image_carousel.dart';
import '../kart/kart_list.dart';



class ProductDetail extends AppPageWithAppBar {
  static String routeName = "/productdetail";
  final count = 0.obs;
  final controller = Get.put(KartController());
  final addWishController = Get.put(WishListController());
  //final appPreferences = Get.find<AppPreferences>();

  //final loginController = Get.put(LoginController());
  final NotificationNotifer notifierController =
      Get.find<NotificationNotifer>();

  static Future<bool?> start<bool>(ProductData productData) {
    return navigateTo<bool>(routeName,
        currentPageTitle: "Product Detail",
        arguments: {'productData' : productData});
  }
  RxInt quantity = 1.obs;




  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Container(
          width: screenWidget,
          decoration:  BoxDecoration(
              gradient: LinearGradient(


                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [MyColors.appColor.shade400,MyColors.kColorWhite]
              )),
          child: Scaffold(
            backgroundColor: MyColors.transparent,
            //appBar: AppBar(backgroundColor: Colors.transparent,),
            floatingActionButton:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: size_15),
                  child: topRowBar(context),
                ),
                buttom(context),
              ],
            ),//topRowBar(BuildContext),
            body: Padding(
              padding: EdgeInsets.only(top: size_76),
              child: Container(
                decoration: const BoxDecoration(
                color: MyColors.kColorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(parent: ClampingScrollPhysics()),
             child: Column(
                children: [ SizedBox(height: size_30,),imageWidget, cardUi,SizedBox(height: size_50,)],
      ),
    ),
              ),
            ),
          ),
        ));
  }

  Widget get imageWidget {
    return Container(
      width: screenWidget,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Stack(
        children: [

          ClipRRect(
    //         borderRadius:BorderRadius.only(
    //   topLeft: Radius.circular(35),
    //   topRight: Radius.circular(35),
    // ) ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(arguments['productData'].image,fit: BoxFit.fill,width: screenWidget,),
              )),
          Positioned(left:size_20,bottom: 0, right: size_22,  child: addToCartButton),
        ],
      ),
    );
  }

  Widget buttom(context){
    var size = MediaQuery.of(context).size;
    return Container(
      width: screenWidget,

      decoration: BoxDecoration(
          color: MyColors.kColorWhite,
          border: Border(top: BorderSide(width: 0.5,color: Colors.grey.shade300,))
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding:  EdgeInsets.only(left: size_20,top: size_10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size_50,
                width: size.width * 0.34,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          if (quantity.value > 0) {
                            quantity.value--;
                          }
                        },
                        child: SizedBox(
                          child: Text(
                            '-',
                            style: GoogleFonts.averiaSerifLibre(
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Obx(() => Text(
                          '${quantity.value}',
                          style: GoogleFonts.averiaSerifLibre(
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          if (quantity.value > 0) {
                            quantity.value++;
                          }
                        },
                        child: SizedBox(
                          child: Text(
                            '+',
                            style: GoogleFonts.averiaSerifLibre(
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.03),
              checkoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget checkoutButton(context){

    var size = MediaQuery.of(context).size;
    return  GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        height: size_50,
        width: size.width * 0.53,
        decoration: BoxDecoration(
            color: MyColors.appColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child:Center(
            child: Text(
              'Add to Cart',
              style: GoogleFonts.poppins(
                color: MyColors.kColorWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topRowBar(context){
    return SizedBox(
      //height: size_80,
      child: Padding(
        padding:  EdgeInsets.only(top: size_20, left: size_20, right: size_0,bottom: size_20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // back button
            Container(
              alignment: Alignment.center,
              height: 40,
              decoration: const ShapeDecoration(
                color: MyColors.kColorWhite,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: MyColors.appColor,
                ),
              ),
            ),

            ///// cart button///
            GestureDetector(
              onTap: (){
                KartPage.start(routeName);
              },
              child: Container(
                alignment: Alignment.center,
                width: size_65,
                height: size_36,
                decoration: BoxDecoration(
                  color: MyColors.kColorGreenDark,
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      UniconsLine.shopping_cart,
                      color: MyColors.kColorBlack,
                    ),
                    SizedBox(width: size_2),
                    GetBuilder<NotificationNotifer>(
                      // specify type as Controller
                      init:
                      NotificationNotifer(), // intialize with the Controller
                      builder: (value) => KartCounter(
                        count: value.lst.length.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get productImageSlider {
    List<Topdeal> topdealList = [];
    topdealList.add(Topdeal(
        id: "3",
        storeId: "1",
        offerImage: "https://jumpq.ai/assets/uploads/category/pet-care.svg",
        couponName: "Pet Care"));
    topdealList.add(Topdeal(
        id: "3",
        storeId: "1",
        offerImage: "https://jumpq.ai/assets/uploads/category/pet-care.svg",
        couponName: "Pet Care"));
    topdealList.add(Topdeal(
        id: "3",
        storeId: "1",
        offerImage: "https://jumpq.ai/assets/uploads/category/pet-care.svg",
        couponName: "Pet Care"));
    return Carousel(topdeal: topdealList);
  }

  Widget get cardUi {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      child: Column(
        children: [
          productName,
          const SizedBox(
            height: 10,
          ),
          ratingReview,
          const SizedBox(
            height: 10,
          ),
          productPrice,
          const SizedBox(
            height: 20,
          ),
          productDetail,

          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget get productName {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        arguments['productData'].productName,
        style:  TextStyles.headingText2(),
      ),
    );
  }

  Widget get ratingReview {
    return Container(
     // width: screenWidget,
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Text(
                  "125 Review",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: MyColors.kColorGrey),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget get productPrice{
    return  Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Text(
          '${arguments['productData'].salePrice}',
          style: TextStyle(fontSize: size_14, fontWeight: FontWeight.bold),
        ),
        Text("${arguments['productData'].productPrice}",
            maxLines: 2,
            style:  TextStyle(
                fontSize: size_12,
                decoration: TextDecoration.lineThrough,
                color: Colors.red,
                fontWeight: FontWeight.w100)),
      ],
    );
  }

  Widget get productDetail {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          "${arguments['productData'].productName}",
          style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 20,
              color: MyColors.kColorLightGrey),
        ),
      ),
    );
  }

  Widget get addButton {
    return Material(
        color: Colors.green,
        shape: const CircleBorder(),
        child: IconButton(
          icon: const Icon(Icons.add),
          color: Colors.white,
          onPressed: () {
            notifierController.add("1");
          },
        ));
  }

  Widget get minusButton {
    return Material(
        color: Colors.red,
        shape: const CircleBorder(),
        child: IconButton(
          icon: const Icon(Icons.remove),
          color: Colors.white,
          onPressed: () {
            notifierController.del();
          },
        ));
  }

  Widget get quntityField {
    return const SizedBox(
      height: 45,
      width: 45,
      child: TextField(
        enabled: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
          hintText: '12',
        ),
      ),
    );
  }

  Widget get addToCartButton {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //ratingReview,



        favouriteButton,

       // addToKartButton
      ],
    );
  }

  Widget get favouriteButton {
    return Material(
        color: MyColors.appColor,
        shape: const CircleBorder(),
        child: IconButton(
          icon: const Icon(Icons.favorite),
          color: Colors.white,
          onPressed: () {
            addWishController.callAddProductInWishListApi(
                arguments['productData'].storeId,
                arguments['productData'].storeProductId);
          },
        ));
  }

  Widget get addToKartButton {
    return ElevatedButton(
        onPressed: () {
          notifierController.add("1");
          controller.callAddToKartApi(
              storeProductId: arguments['productData'].storeProductId,
              storeId: arguments['productData'].storeId);
        },
        child: const Text("Add to kart"),
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()));
  }
}
