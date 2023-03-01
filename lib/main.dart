
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jump_q/environment.dart';
import 'package:jump_q/main_common.dart';
import 'package:jump_q/route.dart';
import 'package:jump_q/splash_screen.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:get/get.dart';

Future<void> main()async{

  await mainCommon(Environment.PROD);

}
