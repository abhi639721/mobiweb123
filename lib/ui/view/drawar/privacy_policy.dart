
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../services/navigator.dart';

class PrivacyPolicy extends AppPageWithAppBar{
  static String routeName = "/privacyPolicy";
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName,
        currentPageTitle: "Privacy Policy");
  }
  @override
  Widget get body{
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return const WebView(
      initialUrl: 'https://jumpq.ai/mobile/privacy-policy',
    );
  }

}