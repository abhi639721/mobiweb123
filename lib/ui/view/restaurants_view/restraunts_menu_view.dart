import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jump_q/controllers/restraunt_controllers/restaurant_detail_controller.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/models/restaurant_model/cat/MenuCategories.dart';
import 'package:jump_q/models/restaurant_model/cat/RestaurantMenus.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/dialog/loader.dart';
import 'package:jump_q/ui/view/restaurants_view/item_detail_view.dart';
import 'package:jump_q/ui/view/restaurants_view/review/reviews_card.dart';
import 'package:jump_q/ui/widget/ratting.dart';
import 'package:jump_q/ui/widget/restraunt_widget/restrant_reviews.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class RestaurantMenuScreen extends StatefulWidget {
  //static String routeName = "/RestaurantMenuScreen";
  final String restaurantId;
  const RestaurantMenuScreen({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  _RestaurantMenuScreenState createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  final restaurantController = Get.put(RestaurantDetailController());
  final appPreferences = Get.find<AppPreferences>();

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) => SizedBox(
        height: size_400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: size_10,
              width: size_200,
              decoration: const BoxDecoration(
                  color: MyColors.appColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
            ),
            //Person Container
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size_5, right: size_5),
                  child: Container(
                      height: size_50,
                      width: size_50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MyColors.kColorBlack,
                        ),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.person,
                          color: Colors.green,
                        ),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.25,
                  height: size_100,
                  child: Consumer(
                    builder: ((context, vale, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(size_5),
                            child: GestureDetector(
                              child: Container(
                                height: size_50,
                                width: size_50,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: MyColors.kColorBlack,
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: MyColors.appColor,
                                      fontSize: size_18),
                                )),
                              ),
                              onTap: () {
                                // var t = context.read<ReservationViewModel>().selectedToTime;
                                // print(t);
                              },
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
            //DateTime
            Center(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  height: size_100,
                  child: Consumer(
                    builder: ((context, value, child) {
                      return CupertinoDatePicker(
                        //backgroundColor: MyColors.appColor.shade100,
                        minimumDate:
                            DateTime.now().subtract(const Duration(days: 1)),
                        minuteInterval: 1,
                        mode: CupertinoDatePickerMode.dateAndTime,
                        onDateTimeChanged: (DateTime dateTime) {
                          // context. read<ReservationViewModel>().formattedDate;
                        },
                      );
                    }),
                  )),
            ),
            SizedBox(height: size_20),
            Center(
              child: SizedBox(
                width: size_200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  child: const Text("Book"),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // final apiServices = Get.put(RestaurantHomeApiServices());
  //Details? details;

  @override
  void initState() {
    callApi();

    // TODO: implement initState
    super.initState();
    // callApiToGetListData();
  }

  callApi() {
    restaurantController.callRestaurantDetailApi(1, widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.restrauntBgColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          floatingActionButton: onTopBackAndFavBtn(),
          body: Obx(() => (restaurantController.isLoader.value)
              ? const Loader()
              : RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                    return callApi();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(size_20),
                                  bottomRight: Radius.circular(size_20)),
                              child: Hero(
                                tag: 'assets/png/burger.png',
                                child: Image(
                                  image: NetworkImage(
                                    restaurantController.details.image
                                        .toString(),
                                    // 'assets/images/burger.jpg'
                                  ),
                                  height: size_220,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: size_15,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 8.0, sigmaY: 5.0),
                                  child: Container(
                                    //width: 100.0,
                                    //height: 30.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey.shade200
                                            .withOpacity(0.1)),
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: RatingStars(rating: 5),
                                    )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        //"fg",
                                        restaurantController
                                            .details.restaurantName
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: size_20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size_5,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: size_2,
                                      ),
                                      SizedBox(
                                        width: size_200,
                                        child: Text(
                                          restaurantController.details.address
                                              .toString(),
                                          style: TextStyle(
                                              color: MyColors.kColorBlack900,
                                              fontSize: size_14,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size_8,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        MapsLauncher.launchCoordinates(
                                            //"28.4525346", "77.5263114",
                                            restaurantController.details.latitude
                                                .toString(),
                                            restaurantController
                                                .details.longitude
                                                .toString(),
                                            '${restaurantController.details.restaurantName}');
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.fmd_good_outlined,
                                            size: size_20,
                                            color: MyColors.appColor,
                                          ),
                                          SizedBox(
                                            width: size_5,
                                          ),
                                          Text(
                                            "Show On the Mape",
                                            style: TextStyle(
                                                fontSize: size_12,
                                                color: MyColors.appColor),
                                          ),
                                        ],
                                      )),

                                  SizedBox(
                                    height: size_8,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Icon(
                                  //       UniconsLine.location_arrow,
                                  //       size: size_14,
                                  //       color: MyColors.appColor,
                                  //     ),
                                  //
                                  //     SizedBox(
                                  //       width: size_6,
                                  //     ),
                                  //     Text(
                                  //       "100 Meter away",
                                  //       style: TextStyle(
                                  //         color: MyColors.kColorBlack900,
                                  //         fontSize: size_14,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              reservation()
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       ElevatedButton(onPressed:(){},
                        //         child:Text('Reviews'),
                        //         style: ButtonStyle(
                        //           shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        //           backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                        //           elevation: MaterialStateProperty.all<double>(0),
                        //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30)),
                        //         ),
                        //       ),
                        //       ElevatedButton(onPressed:(){},
                        //         child:Text('Contacts'),
                        //         style: ButtonStyle(
                        //           shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        //           backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                        //           elevation: MaterialStateProperty.all<double>(0),
                        //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30)),
                        //         ),
                        //       ),
                        //
                        //
                        //
                        //     ],),
                        // ),

                        categoriesItem(),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Recommended',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    width: 90,
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'View all',
                                          style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(UniconsLine.arrow_right,
                                            color: Colors.grey),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size_20,
                        ),

                        gridViewCard(),
                        SizedBox(
                          height: size_10,
                        ),
                        _restrauntReviews(context)
                      ],
                    ),
                  ),
                ))),
    );
  }

  Widget onTopBackAndFavBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size_10, vertical: size_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size_36,
            width: size_36,
            decoration: BoxDecoration(
              color: MyColors.kColorLightWhite,
              borderRadius: BorderRadius.circular(size_100),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: size_3),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.appColor,
                  size: size_20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  RestrauntReviews _restrauntReviews(BuildContext context) {
    return RestrauntReviews(
      title: "Reviews",
      items: List.generate(
        2, //lenth of list
        (index) => const Padding(
          padding: EdgeInsets.all(10),
          child: ReviewsCard(
            name: 'Anshika',
            comment: "Amozing",
            image: 'assets/app_logo.png)',
            price: 20,
          ),
        ),
      ),
    );
  }

  Widget gridViewCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: size_12,
          mainAxisSpacing: size_12,
          mainAxisExtent: size_200,
        ),
        itemCount: restaurantController.restaurantMenus.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 500),
            columnCount: 2,
            child: ScaleAnimation(
              //horizontalOffset: 100.0,
              //
              //verticalOffset: 100.0,
              child: FadeInAnimation(
                  delay: const Duration(milliseconds: 200),
                  child: itemCard(restaurantController.restaurantMenus[index])),
            ),
          );
        },
      ),
    );
  }

  Widget itemCard(RestaurantMenus data) {
    return GestureDetector(
      onTap: () {
        appPreferences.saveRestaurantId(data.restaurantId.toString());
        appPreferences.saveRestaurantMenuId(data.restaurantMenuId.toString());

        Navigator.push(
          context,
          PageTransition(
            duration: Duration(milliseconds: 400),
            //curve: Curves.linear,
            type: PageTransitionType.bottomToTop,
            child: ItemDetailView(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.kColorLightWhite,
          borderRadius: BorderRadius.circular(15),
          // boxShadow: const [
          //   BoxShadow(
          //     color: MyColors.appColor,
          //     blurRadius: 0.1,
          //     spreadRadius: 0.1,
          //     offset: Offset(
          //       0.1,
          //       0.1,
          //     ),
          //   )
          // ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.1),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size_15),
                    topRight: Radius.circular(size_15)),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/png/app_logo-removebg-preview.png',
                  image: data.image.toString(),
                  height: size_120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: size_5, left: 0, right: 0, bottom: 0),
              child: Column(
                children: [
                  Text(
                    data.itemName.toString(),
                    //data.itemName.toString() ,
                    // "Chines Food",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: size_12,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      data.productDescription.toString(),
                      //"Cheese with crunch",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        //fontWeight: FontWeight.w600,
                        fontSize: size_10,
                      ),
                    ),
                  ),
                  SizedBox(height: size_12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        data.itemPrice.toString(),
                        // "₹220",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          fontSize: size_14,
                        ),
                      ),
                      // SizedBox(width: 25),
                      Row(
                        children: [
                          const Icon(CupertinoIcons.heart, color: Colors.red),
                          SizedBox(width: size_5),
                          const Icon(Icons.shopping_cart_checkout),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reservation() {
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context);

        //  showBottomSheet(context: context, builder: Column(children: [],))
      },
      child: Container(
        //width: size_120,
        decoration: BoxDecoration(
          color: MyColors.kColorWhite,
          borderRadius: BorderRadius.circular(size_15),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: size_20, right: size_20, top: size_10),
              child: Image.asset(
                "assets/gif/table.gif",
                height: size_50,
                width: size_50,
              ),
            ),
            //FaIcon(FontAwesomeIcons.chair, color: MyColors.secondaryAppColor),

            Container(
                decoration: BoxDecoration(
                    color: MyColors.restrauntBgColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size_9, vertical: size_3),
                  child: const Text(
                    "Reservation",
                    overflow: TextOverflow.fade,
                  ),
                )),
            // SizedBox(
            //   height: size_5,
            // )
          ],
        ),
      ),
    );
  }

  Widget categoriesItem() {
    //var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20),
      child: SizedBox(
        height: 45,
        // width: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurantController.menuCategories.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: 2,
                child: SlideAnimation(
                  horizontalOffset: 30.0,
                  //
                  //verticalOffset: 100.0,
                  child: FadeInAnimation(
                      child: categoriesCard(
                          restaurantController.menuCategories[index])),
                ),
              );
            }),
      ),
    );
  }

  Widget categoriesCard(MenuCategories menuCategories) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size_8),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder:(context)=>MyApp(items: [],) ));
          setState(() {
            print('vegan');
          });
        },
        child: Container(
          width: 105,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.leaf, color: Colors.green),
              const SizedBox(width: 10),
              Text(
                //"vagas",
                menuCategories.category.toString(),
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Widget categoriesList(){
//   return Container(
//     height: 100,
//     child: ListView.builder(
//        scrollDirection: Axis.horizontal,
//         itemCount: 8,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {},
//                 child: Column(
//           children: <Widget>[
//             Image.asset('assets/png/burger.png',height: 80,width: 80,),
//             Text(
//               "Burger",
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.w600,
//                 fontSize: size_12,
//               ),
//             ),
//           ],
//           ),
//             );
//         }
//           ),
//   );
// }
}
