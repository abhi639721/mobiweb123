import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/primary_elevated_button.dart';
import 'package:jump_q/ui/view/home/home.dart';
import '../../base/base_satateless_widget.dart';
import '../../../../../services/navigator.dart';


class CartNotFound extends BaseStateLessWidget{
  static String routeName = "/dataNotFound";

  CartNotFound({Key? key}) : super(key: key);
  static Future<bool?> start<bool>() {
    return navigateOffAll<bool>(routeName,
        currentPageTitle: "DataNotFound", );
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          const SizedBox(height: 10,),
          text,
          const SizedBox(height: 20,),
          button
        ],
      ),
    );
  }
  Widget get image {
    return Image.asset('assets/images/EmptyCart.png',height: 200,width: 200);
}
Widget get text{
    return const Text("Cart is Empty",style: TextStyle(color: MyColors.appColor,fontWeight: FontWeight.bold,fontSize: 14),);
}
Widget get button{
    return PrimaryElevatedBtn("Back to Home",() =>navigateOffAll(Home.routeName));
}

}
