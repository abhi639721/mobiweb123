





import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jump_q/notification_service.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/base/base_satateless_widget.dart';

class NotificationNotFound extends BaseStateLessWidget{
  static String routeName = "/dataNotFound";

  const NotificationNotFound({Key? key}) : super(key: key);
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
  Widget get image{
    return  Image.asset('assets/images/emptyNotification.png',height: 200,width: 200);
  }
  Widget get text{
    return const Text("We'll notify you when something arrives!",style: TextStyle(color: MyColors.appColor,fontWeight: FontWeight.bold,fontSize: 14),);
  }
  Widget get button{
    return  Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            textStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 15)
        ),
        onPressed: () {
         // navigateOffAll(Home.routeName);
          NotificationService()
              .showNotification(title: 'Sample title', body: 'It works!');
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
          child:  Text("Back to home",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
