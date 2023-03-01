import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/wish/product_wish_list.dart';
import 'package:jump_q/ui/view/wish/store_wish_list.dart';

import '../../../services/navigator.dart';

class WishListTabs extends StatefulWidget {
  const WishListTabs({Key? key}) : super(key: key);
  @override
  State<WishListTabs> createState() => _WishListTabsState();
  static String routeName = "/wishListTabs";
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName,
        currentPageTitle: "Wish List ");
  }
}
class _WishListTabsState extends State<WishListTabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                TabBar(
                  tabs: [
                    Tab(child: Text('Products',style: TextStyle(color: MyColors.colorTextBlack),)),
                    Tab(child: Text('Stores',style: TextStyle(color: MyColors.colorTextBlack))),
                  ],
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          children: [
            WishList(),
             const StoreWishList(),
          ],
        ),
      ),
    ));
  }
}
