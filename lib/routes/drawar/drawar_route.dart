import 'package:get/get.dart';
import 'package:jump_q/ui/view/drawar/about_us.dart';
import 'package:jump_q/ui/view/drawar/my_accounts/accounts.dart';
import 'package:jump_q/ui/view/drawar/my_accounts/order_tracking.dart';
import 'package:jump_q/ui/view/drawar/my_order_history.dart';
import 'package:jump_q/ui/view/drawar/mywishlist.dart';
import 'package:jump_q/ui/view/drawar/privacy_policy.dart';
import '../../ui/view/drawar/help.dart';
import '../../ui/view/loginandsignup/change_password.dart';

class DrawarRoutes{
  DrawarRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: PrivacyPolicy.routeName, page: () =>  PrivacyPolicy()),
    GetPage(name: AboutUs.routeName, page: () =>  AboutUs()),
    GetPage(name: Accounts.routeName, page: () =>  Accounts()),
    GetPage(name: OrderTracking.routeName, page: () =>  OrderTracking()),
    GetPage(name: Help.routeName, page: () =>  Help()),
    GetPage(name: ChangePassword.routeName, page: () =>  ChangePassword()),
    GetPage(name: MyWishList.routeName, page: () =>  MyWishList()),
    GetPage(name: MyOrderHistory.routeName, page: () =>  MyOrderHistory()),


  ];
}