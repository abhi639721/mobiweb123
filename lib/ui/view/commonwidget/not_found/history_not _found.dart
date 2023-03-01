import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/primary_elevated_button.dart';
import 'package:jump_q/ui/view/home/home.dart';
import '../../base/base_satateless_widget.dart';
import '../../../../../services/navigator.dart';


class HistoryNotFound extends BaseStateLessWidget{
  static String routeName = "/dataNotFound";

  HistoryNotFound({Key? key}) : super(key: key);
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
          const SizedBox(height: 8,),
          text,
          const SizedBox(height: 15,),
          button
        ],
      ),
    );
  }
  Widget get image {
    return  Image.network('https://multivendor.amrkart.com/public/not-found.jpg',height: 200,width: 200);
  }
  Widget get text{
    return const Text("Place your First Order",style: TextStyle(color: MyColors.appColor,fontWeight: FontWeight.bold,fontSize: 14),);
  }
  Widget get button{
    return PrimaryElevatedBtn("Shop Now",() =>navigateOffAll(Home.routeName));
  }
}
