import 'package:get/get.dart';
import 'package:jump_q/ui/view/drawar/my_accounts/order_tracking.dart';
import 'package:jump_q/ui/view/drawar/mywishlist.dart';
import 'package:jump_q/ui/view/home/tab/orderHistory/order_history.dart';
import 'package:jump_q/ui/view/loginandsignup/change_password.dart';
import '../../../../data/preferences/AppPreferences.dart';
import '../../base/page.dart';
import 'package:flutter/material.dart';
import '../../../../services/navigator.dart';
import '../../../../theme/my_theme.dart';

class Accounts extends AppPageWithAppBar {
  static String routeName = "/accounts";
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName, currentPageTitle: "Accounts");
  }

  final appPreferences = Get.find<AppPreferences>();
  Accounts({Key? key}) : super(key: key);
  @override
  Widget get body {
    return Scaffold(
      backgroundColor: MyColors.kColorWhite,
      body: Padding(
        padding:  EdgeInsets.only(top: size_15),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: size_15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  order,
                wishList
              ],),
            ),



            // ListView(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   children: [
            //     orderHistory,
            //      SizedBox(
            //       height: size_5,
            //     ),
            //     if (appPreferences.isLoggedIn) wishList,
            //      SizedBox(
            //       height: size_5,
            //     ),
            //     if (appPreferences.isLoggedIn) changePassword
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget get orderHistory {
    return InkWell(
      onTap: () {
        OrderHistoryPage.start();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          color: MyColors.backgroundLBlueColor,
          border: Border.all(width: 0.5,color: MyColors.kColorBlack),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: size_60,
        width: screenWidget/2.2,

        child: Center(
          child: Text("Order History",
             style: TextStyle(
                 fontSize: size_18,
                 fontWeight: FontWeight.w500,
                 fontFamily: 'Montserrat',

                 color: Colors.black87)),
        ),
      ),
    );
  }
  Widget get order {
    return InkWell(

      onTap: () {
        OrderTracking.start();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyColors.backgroundLBlueColor,
          border: Border.all(width: 0.5,color: MyColors.kColorBlack),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: size_44,
        width: screenWidget/2.3,

        child: Center(
          child: Text("Orders",
              style: TextStyle(
                  fontSize: size_16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Colors.black87)),
        ),
      ),
    );
  }



  Widget get wishList {
    return InkWell(
      onTap: () {
        MyWishList.start();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyColors.backgroundLBlueColor,
          border: Border.all(width: 0.5,color: MyColors.kColorBlack),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: size_44,
        width: screenWidget/2.3,

        child:  Center(
          child: Text("My Wish List",
              style: TextStyle(
                  fontSize: size_16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Colors.black87)),
        ),
      ),
    );
  }

  Widget get changePassword {
    return InkWell(
      onTap: () {
        ChangePassword.start();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 40,
        color: MyColors.kColorWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Change Password",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat',
                    color: Colors.black87)),
            // TextSpan(text: "Name: Email id", style: TextStyle(fontFamily: 'Montserrat', color: Colors.black26)),),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: size_20,
            ),
          ],
        ),
      ),
    );
  }
}
