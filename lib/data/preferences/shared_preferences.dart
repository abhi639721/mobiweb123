import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'AppPreferences.dart';

class SharedConfig{

 static final String authToken=Get.find<AppPreferences>().authToken;
 static final bool isLoggedIn=Get.find<AppPreferences>().isLoggedIn;
 static final String userId=Get.find<AppPreferences>().userId;
}