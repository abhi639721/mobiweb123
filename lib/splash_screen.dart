
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/addFCMTokenController.dart';
import 'package:jump_q/data/network/restaurant_apiservices/restaurant_home_api_services.dart';
import 'package:jump_q/models/Maintenance_mode.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/home/home.dart';
import 'package:jump_q/ui/view/tutorial/tutorial.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'controllers/kart/KartController.dart';
import 'data/preferences/AppPreferences.dart';
import 'ui/view/maintenance_mode_view.dart';
import 'utils/common_util.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class SplashScreen extends StatefulWidget{
  static String routeName = "/splash";

  static Future<bool?> start<bool>(String currentPageTitle) {
    return navigateOffAll<bool>(routeName, currentPageTitle: currentPageTitle);
  }

  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final kartController = Get.put(KartController());
  final addFCMTokenController = Get.put(AddFCMTokenController());
  final appPreferences = Get.find<AppPreferences>();
  final apiServices = Get.put(RestaurantHomeApiServices());
  late MaintenanceModel maintenanceModel;
  final isLoader = true.obs;
  String fcmToken = "" ;
  //String? deviceId;
  String deviceName ='';
  String deviceVersion ='';
  String identifier= '';
 // static const Channel = MethodChannel('com.jumpq.getdID');
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  Future<AndroidDeviceInfo> getInfo(){
    return deviceInfo.androidInfo;
  }

  bool intro = true;

  @override
  void initState() {
    super.initState();
    getFCMTokenApi();
    FirebaseCrashlytics.instance.setCustomKey(appPreferences.userId, appPreferences.userName);
    callMaintenanceApi();
    appPreferences.saveStoreId("0");
    kartController.callKartCountApi();

  }


   ///call add FCMTokenApi
  getFCMTokenApi(){
    FirebaseMessaging.instance.getToken().then((value) async{
      fcmToken = value!;
      var deviceId = await PlatformDeviceId.getDeviceId;
      print("fcm:$value");
      addFCMTokenController.callAddFCMTokenApi("$deviceId", fcmToken);
      print("DeviceId====>$deviceId");
    });

  }




  /// MAINTENANCE MODE
  void callMaintenanceApi() async {
    bool connectionResult = await Common.inInternet();
    if (!connectionResult) {
      Common.showToast("No Internet Connection!");
      return;
    }
    final response = await apiServices.maintenanceApi();
    print(response);
    isLoader.value = false;
    if (response == null) Common.showToast("Network Issue!");
    if (response!.status != false) {
      maintenanceModel = response;
      var v = maintenanceModel.maintenanceMode;
      print(v);
      if (v.toString() == "0") {
        _navigateToHome();
      }
      if (v.toString() == "1") {
        MaintenanceModeView.start();
      } else {
        _navigateToHome();
      }
    } else {}
  }

  ///Navigate To Home splash
  _navigateToHome() async {

    await Future.delayed(const Duration(seconds: 0), () {});
    if (!appPreferences.isTutorialShow) {
      appPreferences.saveIntroShow(true);
      Tutorial.start();
      return;
    }

    Home.start("0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : MyColors.kColorWhite,
      body: SizedBox(
        height: double.infinity,
        width: double.maxFinite,
        child: Center(
          child: Image.asset(
            "assets/png/app_logo.png",
            width: size_200,
            height: size_200,
          ),
        ),
      ),
    );
  }
}
