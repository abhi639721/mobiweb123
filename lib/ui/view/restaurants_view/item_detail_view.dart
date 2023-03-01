import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jump_q/controllers/restraunt_controllers/add_to_cart_rest_controller.dart';
import 'package:jump_q/controllers/restraunt_controllers/restaurant_item_details_controller.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/models/restaurant_model/item_model/Options.dart';
import 'package:jump_q/notifire/kart_notifire.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/kart_counter.dart';
import 'package:jump_q/ui/view/dialog/loader.dart';
import 'package:jump_q/ui/view/kart/kart_list.dart';
import 'package:unicons/unicons.dart';

class ItemDetailView extends StatefulWidget {
  //const ItemDetailView({Key? key}) : super(key: key);

  const ItemDetailView({Key? key}) : super(key: key);
  static String routeName = "/ItemDetailView";

  static Future<bool?> start<bool>(restaurantId, restaurantMenuId) {
    return navigateTo<bool>(routeName,
        currentPageTitle: "ItemDetailView",
        arguments: {
          'restaurantId': restaurantId,
          'restaurantMenuId': restaurantMenuId
        });
  }

  State<ItemDetailView> createState() => _ItemDetailViewState();
}

class _ItemDetailViewState extends State<ItemDetailView> {
  final itemController = Get.put(RestaurantItemDetailsController());
  final appPreferences = Get.find<AppPreferences>();
  final controller = Get.put(RestaurantKartController());

  bool vertical = false;
  final List<bool> _selectedItemSize = <bool>[true, false, false];
  List<Options> options = [];
  int selectedIdx = 0;
  String location = 'Null, Press Button';

  var quantity = 1;

  var price;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemController.callRestaurantItemDetailApi(
        appPreferences.restaurantId, appPreferences.restaurantMenuId);
    price = itemController.itemData?.itemPrice;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [MyColors.appColor.shade600, MyColors.kColorWhite])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerTop,
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [topRowBar(context), buttom(context)],
            ),
            body:
                itemController.isLoader.value //&& itemController.itemData == null
                    ? const Loader()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: size_80),
                          child: Container(
                            //height: double.infinity,
                            // margin: EdgeInsets.only(bottom: size_10),
                            decoration: const BoxDecoration(
                              color: MyColors.kColorWhite,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                mainItemImage(context),

                                itemName(),
                                itemDescription(),
                                itemPrice(),

                                // category
                                moreCategory(),

                                // choose size
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size_20,
                                      left: size_20,
                                      right: size_20),
                                  child: Text(
                                    "Choose size ",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: size_16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: size_5),
                                  child: SizedBox(
                                    height: size_150,
                                    child: itemSizeList(),
                                  ),
                                ),
                                // togleBTN(),

                                SizedBox(
                                  height: size_80,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
          ),
        ),
      ),
    ));
  }

  Widget moreCategory() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() {}),
            child: Container(
              height: size_44,
              //width: 105,
              decoration: BoxDecoration(
                color: MyColors.restrauntBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: size_8, vertical: size_5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/png/sauce.png',
                    ),
                    SizedBox(width: size_5),
                    Text(
                      'Ketchup',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: size_44,
              //width: 145,
              decoration: BoxDecoration(
                color: MyColors.restrauntBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: size_10, vertical: size_5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.cheese,
                      color: Colors.brown,
                    ),
                    SizedBox(width: size_5),
                    Text(
                      'Cheese',
                      style: GoogleFonts.poppins(
                        fontSize: size_14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topRowBar(context) {
    return SizedBox(
      //height: size_80,
      child: Padding(
        padding: EdgeInsets.only(
            top: size_14, left: size_8, right: size_10, bottom: size_20),
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
              onTap: () {
                KartPage.start(location);
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
                      init: NotificationNotifer(),
                      // intialize with the Controller
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

  Widget itemName() {
    print("#######${itemController.itemData?.itemName.toString()??"data"}");
    return Padding(
      padding: EdgeInsets.only(top: size_10, left: size_20, right: size_20),
      child: Text(
        itemController.itemData?.itemName.toString()??"",
        // "Burger",
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget itemDescription() {
    return Padding(
      padding: EdgeInsets.only(
        left: size_20,
      ),
      child: Text(
        itemController.itemData?.itemDescription.toString()??"",
        style: GoogleFonts.poppins(
          color: MyColors.kTextColorBlack,
          fontSize: size_16,
          //fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget itemPrice() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        price ?? "",
        //"₹220",
        style: GoogleFonts.poppins(
          color: Colors.deepOrange,
          fontSize: 26,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget itemSizeList() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: itemController.options.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => setState(() {
              selectedIdx = index;
              price = itemController.options[index].price;
              print(price);
            }),
            child: Container(
              decoration: BoxDecoration(
                //  color: (selectedIdx ==index)?MyColors.appColor.shade400:null,
                border: (selectedIdx == index)
                    ? Border.all(color: MyColors.kColorBlack700)
                    : null,
              ),
              width: size_120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: index == 0
                        ? size_40
                        : index == 1
                            ? size_60
                            : index == 2
                                ? size_70
                                : size_76,
                    width: index == 0
                        ? size_70
                        : index == 1
                            ? size_90
                            : index == 2
                                ? size_100
                                : size_76,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/png/app_logo-removebg-preview.png',
                      image: itemController.itemData!.image.toString(),

                      // fit: BoxFit.fill,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${itemController.options[index].price.toString()}\n',
                          style: GoogleFonts.poppins(
                              color: MyColors.kColorRed,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text:
                              itemController.options[index].options.toString(),
                          style: GoogleFonts.poppins(
                              color: MyColors.kColorRed,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );

          // Padding(
          //   padding:  EdgeInsets.all(size_6),
          //   child: SizedBox(
          //       height: index==0? size_40:index==1?size_60:index==2?size_70:size_76,
          //       width: index==0? size_80:index==1?size_100:index==2?size_120:size_76,
          //       child: Center(child: itemSizeCard(itemController.options[index]))),
          // );
        });
  }

  Widget buttom(context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: MyColors.kColorWhite,
          border: Border(
              top: BorderSide(
            width: 0.5,
            color: Colors.grey.shade300,
          ))),
      child: Padding(
        padding: EdgeInsets.only(top: size_10, bottom: size_10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                      onTap: () {
                        setState(() {
                          quantity--;
                        });
                      },
                      child: Text(
                        '-',
                        style: GoogleFonts.averiaSerifLibre(
                            fontSize: size_22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '$quantity',
                      style: GoogleFonts.averiaSerifLibre(
                          fontSize: size_22, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Text(
                        '+',
                        style: GoogleFonts.averiaSerifLibre(
                            fontSize: 22, fontWeight: FontWeight.bold),
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
    );
  }

  Widget checkoutButton(context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        controller.callAddToKartApi(
          restaurantMenuId:
              itemController.itemData!.restaurantMenuId.toString(),
          restaurantId: itemController.itemData!.restaurantId.toString(),
          quantity: quantity,
        );

        Navigator.pop(context);
      },
      child: Container(
        height: size_50,
        width: size.width * 0.53,
        decoration: BoxDecoration(
            color: MyColors.appColor, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add to Cart',
                style: GoogleFonts.poppins(
                  color: MyColors.kColorWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$price',
                style: GoogleFonts.poppins(
                  fontSize: size_18,
                  color: MyColors.kColorWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainItemImage(context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(0),
        //height: size_280,
        width: size.width / 1.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          color: MyColors.kColorWhite,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/png/app_logo-removebg-preview.png',
                image: itemController.itemData?.image.toString()??"",
                // height: size_200,
                // width: size_200,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
