


import 'package:flutter/material.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';

class CashOnCounter extends StatefulWidget {
  const CashOnCounter({Key? key}) : super(key: key);
  static String routeName = "/cashOnCounter";
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName,
        currentPageTitle: "CashOnCounter",);
  }

  @override
  State<CashOnCounter> createState() => _CashOnCounterState();
}

class _CashOnCounterState extends State<CashOnCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: MyColors.kColorWhite,
        foregroundColor: MyColors.statusBarColor,
        title: Text('Payment'),
      ),
      body: Center(child: Text('Pay on counter'),),
    );
  }
}
