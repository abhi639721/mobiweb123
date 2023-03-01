import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import '../wish/wish_list_tab.dart';

class MyWishList extends StatefulWidget {
  static String routeName = "/history_d";
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName, currentPageTitle: "Wish List ");
  }

  const MyWishList({Key? key}) : super(key: key);

  @override
  State<MyWishList> createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  final appPreferences = Get.find<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.kColorWhite,
          foregroundColor: MyColors.statusBarColor,
          title: const Text('Wish List'),
        ),
        body: const WishListTabs());
  }
}
