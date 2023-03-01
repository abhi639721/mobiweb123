import 'package:flutter/material.dart';

import '../base_getx_controller.dart';

abstract class RefreshableWidgetController extends BaseController {
  @protected
  final ChangeNotifier refresher;
   RefreshableWidgetController({required this.refresher});
   @override
  void onInit(){
     super.onInit();
     registerListener(refresher);
   }
   void registerListener (ChangeNotifier refresher);

}