import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jump_q/custom_utils/customutils.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/notifire/kart_notifire.dart';
import 'package:jump_q/utils/common_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/dio_client.dart';
import '../../data/preferences/AppPreferences.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
   try{
     Get.put<AppPreferences>(AppPreferences(sharedPreferences: await SharedPreferences.getInstance()),permanent: true);
      Get.put<DioClient>(DioClient(),permanent: true);
     Get.put<SharedConfig>(SharedConfig(),permanent: true);
     Get.put<Session>(Session(),permanent: true);
     Get.put< NotificationNotifer>(NotificationNotifer(),permanent: true);
     Get.put< Common>(Common(),permanent: true);
     Get.put< Utils>(Utils(),permanent: true);
   }catch(e){
     debugPrint("Error in InitialBindings");
   }

  }
  
}