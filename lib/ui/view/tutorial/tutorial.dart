import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jump_q/ui/view/home/home.dart';

import '../../../data/preferences/AppPreferences.dart';
import '../../../services/navigator.dart';
import '../base/page.dart';
import 'full_screen.dart';

class Tutorial extends AppPageWithAppBar {
  static String routeName = "/tutorial";
  final appPreferences = Get.find<AppPreferences>();
  static Future<bool?> start<bool>() {
    return navigateOffAll<bool>(routeName);
  }

  @override
  double? get toolbarHeight => 0;

  @override
  Widget get body {
    return Stack(
      children: <Widget>[
        FullScreen(),
         Positioned.fill(bottom:40,child: Align(alignment: Alignment.bottomCenter,child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
               textStyle: const TextStyle(
                   color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 15)),
           onPressed: () {appPreferences.saveTutorialShow(true);Home.start("0");},
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
             child: const Text('Lets Get Started',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
           ),
         ),),)

      ],
    );
  }
}