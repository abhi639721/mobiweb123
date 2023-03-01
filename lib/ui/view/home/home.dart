import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/kart/KartController.dart';
import 'package:jump_q/ui/view/home/notification/notification_view.dart';
import 'package:jump_q/ui/view/home/tab/dashboard/dashboard.dart';
import 'package:jump_q/ui/view/home/tab/offers/offers_page.dart';
import 'package:jump_q/ui/view/home/tab/orderHistory/order_history.dart';
import 'package:jump_q/ui/view/kart/kart_list.dart';
import 'package:jump_q/ui/view/loginandsignup/login_page.dart';
import 'package:jump_q/ui/view/qr_scanner_option/StoreScan.dart';
import 'package:jump_q/ui/view/wish/product_wish_list.dart';
import 'package:jump_q/utils/common_util.dart';
import 'package:jump_q/utils/palette.dart';
import 'package:new_version/new_version.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:upgrader/upgrader.dart';
import '../../../data/preferences/AppPreferences.dart';
import '../../../notifire/kart_notifire.dart';
import '../../../services/navigator.dart';
import '../../../theme/my_theme.dart';
import '../drawar/mydrawer.dart';
import '../commonwidget/kart_counter.dart';
import '../wish/wish_list_tab.dart';


class Home extends StatefulWidget {
  static String routeName = "/home";


   const Home({Key? key,}) : super(key: key);

  static Future<bool?> start<bool>(String storeId) {
    return navigateOffAll<bool>(routeName,arguments: ['storeId']);
  }

  void openStorePageAtClickOnList(int storeId) {}

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


 //// This is Tutorial coach
 late TutorialCoachMark tutorialCoachMark;
 GlobalKey homeKey = GlobalKey();
 GlobalKey wishKey = GlobalKey();
 GlobalKey qrKey = GlobalKey();
 GlobalKey historyKey = GlobalKey();
 GlobalKey offerKey = GlobalKey();
 GlobalKey drawerKey = GlobalKey();
 GlobalKey storeKey = GlobalKey();
 GlobalKey restaurantKey = GlobalKey();
 final kartController = Get.put(KartController());



 void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: createTarget(),
      colorShadow: MyColors.appColor.shade600,
      textSkip: "Skip",
      paddingFocus: 10,
      opacityShadow: 0.5,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    )..show(context: context);

  }

  List<TargetFocus> createTarget() {
    List<TargetFocus> targets = [];
    ///drawwer
    // targets.add(
    //   TargetFocus(
    //     identify: "drawer",
    //     keyTarget: drawerKey,
    //     alignSkip: Alignment.topRight,
    //     contents: [
    //       TargetContent(
    //         align: ContentAlign.top,
    //         builder: (context, controller) {
    //           return Container(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: const <Widget>[
    //                 Text(
    //                   "here more option for user",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
    // ///store
    // targets.add(
    //   TargetFocus(
    //     identify: "Store",
    //     keyTarget: storeKey,
    //     alignSkip: Alignment.topRight,
    //     contents: [
    //       TargetContent(
    //         align: ContentAlign.top,
    //         builder: (context, controller) {
    //           return Container(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: const <Widget>[
    //                 Text(
    //                   "Here shopping store and malls",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
    // ///restaurant
    // targets.add(
    //   TargetFocus(
    //     identify: "restaurants",
    //     keyTarget: restaurantKey,
    //     alignSkip: Alignment.topRight,
    //     contents: [
    //       TargetContent(
    //         align: ContentAlign.top,
    //         builder: (context, controller) {
    //           return Container(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: const <Widget>[
    //                 Text(
    //                   "Go for Food",
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
    ///home
    targets.add(
      TargetFocus(
        identify: "Home",
        keyTarget: homeKey,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    ///wishList
    targets.add(
      TargetFocus(
        identify: "WishList",
        keyTarget: wishKey,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "your favourite Store and products",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    ///qrcode
    targets.add(
      TargetFocus(
        identify: "QR code scanner",
        keyTarget: qrKey,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Scene QR of Store Here",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    ///history
    targets.add(
      TargetFocus(
        identify: "History",
        keyTarget: historyKey,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Order History",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    ///offer
    targets.add(
      TargetFocus(
        identify: "Offer",
        keyTarget: offerKey,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Running Offers",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );

    return targets;


}






  String location = 'Null, Press Button';
  String address = 'Location';
  String locality = 'Your Current\n';
  final appPreferences = Get.find<AppPreferences>();
  // Properties & Variables needed
  final isStore = false.obs;
  late DateTime currentBackPressTime;
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    const Dashboard(isStore: false),
    WishList(),
    const OrderHistoryPage(),
  //OffersPage(),

    const Dashboard(isStore: false),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard(isStore: false); // Our first view in viewport
  @override
  void initState() {
    //Firebase.initializeApp();
    final newVersion = NewVersion(
      androidId: 'com.jumpq.jump_q',
    );

    Timer(const Duration(milliseconds: 800), () {
      checkNewVersion(newVersion);
    });
    super.initState();
    if(appPreferences.isIntroShow){
      createTutorial();
      appPreferences.saveIntroShow(false);
      return;
    }


    //WidgetsBinding.instance.addPersistentFrameCallback(_targetLayout);
    //if(Platform.isAndroid) {
      FirebaseMessaging.instance.getToken().then((value) {
        String? token = value;
        print("fcm:$token");
      });
   // }
    getAddress();
  }

 void checkNewVersion(NewVersion newVersion) async {
   final status = await newVersion.getVersionStatus();
   if(status != null) {
     if(status.canUpdate) {
       // showDialog(
       //   context: context,
       //   builder: (BuildContext context) {
       //     return UpdateDialog(
       //       allowDismissal: true,
       //       description: status.releaseNotes!,
       //       version: status.storeVersion,
       //       appLink: status.appStoreLink,
       //     );
       //   },
       // );
       newVersion.showUpdateDialog(
         context: context,
         versionStatus: status,
         dialogText: 'New Version is available in the store (${status.storeVersion}), update now!',
         dialogTitle: 'Update is Available!',
       );
     }
   }
 }



 @override
  Widget build(BuildContext context) {
    return WillPopScope(child: body, onWillPop:   () async {
      final shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Do you want to exit?'),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'),
              ),
            ],
          );
        },
      );
      return shouldPop!;
    },);

  }
  Widget get body{
    return Scaffold(
      drawer:  DrawerDashboard(),
      appBar: appBar(context),
      body: UpgradeAlert(
        child: PageStorage(
          bucket: bucket,
          //child: currentScreen,
          child: currentScreen,
        ),
      ),
      floatingActionButton: storeDetail,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  dashboard,
                  wishList,
                ],
              ),
              // Right Tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  orderHistory,
                  offer
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Exit App");
      return Future.value(false);
    }
    return Future.value(true);
  }
  ///QR CODE SCANNER
  Widget get storeDetail {
    return FloatingActionButton(
      key: qrKey,
      backgroundColor: MyColors.appColor,
      child: const Icon(Icons.qr_code_scanner,color: Colors.white,),
      onPressed: () {
   StoreScanPage.start();
      },
    );
  }
 /// HOME
  Widget get dashboard {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        appPreferences.saveStoreId("0");
        setState(() {

          currentScreen = const Dashboard(
            isStore: false,
          ); // if user taps on this dashboard tab will be active
          currentTab = 0;
        });
      },
      child: Column(
        key: homeKey,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          SizedBox(//key: homeKey,
            child: Icon(

              Icons.home_outlined,
              color: currentTab == 0 ? MyColors.appColor : Colors.grey,
            ),
          ),
          Text(
            'Home',
            style: TextStyle(
              color: currentTab == 0 ? MyColors.appColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
////wishList
  Widget get wishList {
    return MaterialButton(

      minWidth: 40,
      onPressed: () {
        setState(() {
          currentTab = 1;
          appPreferences.saveStoreId("0");
          //currentScreen = const WishListTabs();
          if (appPreferences.isLoggedIn) {
            currentScreen = const WishListTabs();
          } else {
            Common.showToast("You need to LogIn");
            navigateOffAll( LogInScreen.routeName);
            //LogInScreen().;
          } // if user
        });
      },
      child: Column(
        key: wishKey,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.card_travel,
            color: currentTab == 1 ? MyColors.appColor : Colors.grey,
          ),
          Text(
            'Wish List',
            style: TextStyle(
              color: currentTab == 1 ? MyColors.appColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
///orderHistory
  Widget get orderHistory {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          appPreferences.saveStoreId("0");
          if (appPreferences.isLoggedIn) {
            currentScreen = const OrderHistoryPage();
          } else {
            Common.showToast("You need to LogIn");
            navigateOffAll( LogInScreen.routeName);
             //LogInScreen().;
          } // if user taps on this dashboard tab will be active
          currentTab = 2;
        });
      },
      child: Column(
        key: historyKey,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.list,
            color: currentTab == 2 ? MyColors.appColor : Colors.grey,
          ),
          Text(
            'History',
            style: TextStyle(
              color: currentTab == 2 ? MyColors.appColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
////offer
  Widget get offer {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          appPreferences.saveStoreId("0");
          currentScreen = const OffersPage();
         // Common.showToast("Coming Soon");// if user taps on this dashboard tab will be active
          currentTab = 3;
        });
      },
      child: Column(
        key: offerKey,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.discount_outlined,
            color: currentTab == 3 ? MyColors.appColor : Colors.grey,
          ),
          Text(
            'Offer',
            style: TextStyle(
              color: currentTab == 3 ? MyColors.appColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(elevation: 0.0,
      leading: Builder(builder: (BuildContext context) {
        return GestureDetector(

          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: const Icon(
                Icons.menu,
                color: Palette.appColor,
              ),
            ),
          ),
        );
      }),
      title: InkWell(
        onTap: () async {
          Position position = await _getGeoLocationPosition();
          location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
          getAddressFromLatLong(position);
        },
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              size: size_25,
              color: MyColors.appColor,
            ),
            Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: locality,
                      style: const TextStyle(fontSize: 16, color:Palette.colorTextBlack),
                      children: <TextSpan>[
                        TextSpan(
                          text: address,
                          style:  TextStyle(
                            color: Palette.colorTextBlack,
                            fontSize: size_12,
                          ),
                        ),
                      ]),
                ),

              ],
            ),
          ],
        ),
      ),
      actions: [
        if (appPreferences.isLoggedIn)
          InkWell(
            onTap: () {
              if (appPreferences.isLoggedIn) {
                KartPage.start(location);
              } else {
                LogInScreen.start();
              }
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: MyColors.appColor, size: 25)),

                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child:
                    //Text(kartController.kartList.toString(),style: TextStyle(color: MyColors.kColorRed,fontSize: 19),),
                    GetBuilder<NotificationNotifer>(
                      // specify type as Controller
                      init: NotificationNotifer(),
                      // intialize with the Controller
                      builder: (value) => KartCounter(
                        count: value.lst.length.toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        InkWell(
          onTap: () {
            NotificationView.start();
          },
          child: Padding(
            padding:
            const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
            child: Stack(
              children:const [
                 Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.notifications_active_rounded,
                        color: MyColors.appColor, size: 26)),

                // Positioned(
                //   top: 0,
                //   left: 0,
                //   right: 0,
                //   child: GetBuilder<NotificationNotifer>(
                //     // specify type as Controller
                //     init: NotificationNotifer(),
                //     // intialize with the Controller
                //     builder: (value) => KartCounter(
                //       count: value.lst.length.toString(),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        )
      ],
      backgroundColor: MyColors.kColorWhite,
      shadowColor: Colors.transparent,
    );
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print("placemarks $placemarks");
    Placemark place = placemarks[0];
    address =
        //'${place.subLocality},'

        //'${place.postalCode},'
        ' ${place.locality}';
    locality = '${place.subLocality},\n';
    setState(() {});
  }

  void getAddress() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    getAddressFromLatLong(position);
  }
}

