import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/primary_elevated_button.dart';
import 'package:jump_q/ui/view/home/home.dart';
import '../../base/base_satateless_widget.dart';
import '../../../../../services/navigator.dart';


class StoreNotFound extends BaseStateLessWidget{
  static String routeName = "/dataNotFound";

  StoreNotFound({Key? key}) : super(key: key);
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
          const SizedBox(height: 20,),
          text,
          const SizedBox(height: 20,),
          button
        ],
      ),
    );
  }
  Widget get image {
    return  Image.network('https://cdn-icons-png.flaticon.com/512/7032/7032423.png',height: 150,width: 150,);
  }
  Widget get text{
    return const Text("No favorite store found",style: TextStyle(color: MyColors.appColor,fontWeight: FontWeight.bold,fontSize: 14),);
  }
  Widget get button{
    return PrimaryElevatedBtn("Add Favorite",() =>navigateOffAll(Home.routeName));
  }

}
