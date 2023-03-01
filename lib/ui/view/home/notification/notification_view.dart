
import 'package:flutter/material.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/commonwidget/not_found/notification_not_found.dart';
class NotificationView extends AppPageWithAppBar{
  static String routeName = "/notificationView";

  NotificationView({Key? key}) : super(key: key);
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName, currentPageTitle: "Notification",);
  }
  @override
  Widget get body{
    return
      NotificationNotFound();
    // ListView.builder(itemBuilder: (context,index){
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Container(
    //       color: MyColors.transparent,
    //
    //       child: Row(children: [
    //     Image.asset("assets/png/app_logo.png",height: size_80,width:size_80 ,),
    //         SizedBox(width: size_6,),
    //
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children:  [
    //           const Text("Notification",style: TextStyle(fontWeight: FontWeight.bold),),
    //           SizedBox(height: size_6,),
    //           SizedBox(
    //               width : screenWidget/1.5,child: const Text("Description massage Description massage Description massage",
    //             maxLines: 1,
    //             overflow: TextOverflow.ellipsis,))
    //         ],)
    //     ],),),
    //   );
    // });
  }
}
