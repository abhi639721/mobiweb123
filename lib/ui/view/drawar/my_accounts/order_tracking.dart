


import 'package:flutter/material.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';

class OrderTracking extends StatefulWidget {
  static String routeName = "/OrderTracking";

  const OrderTracking({Key? key}) : super(key: key);
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName, currentPageTitle: "OrderTracking");
  }

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundLBlueColor,
      appBar: AppBar(title: const Text("Orders",),backgroundColor: MyColors.kColorWhite,foregroundColor: MyColors.kColorBlack,),
      body: Container(
        height: size_220,
      decoration: const BoxDecoration(color: MyColors.kColorWhite),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/png/app_logo.png',height: 150,),
              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Verka Rusk ",style: TextStyle(fontSize:size_18,fontWeight:FontWeight.bold,color: MyColors.kColorBlack),),
                  SizedBox(height: size_8,),
                  const Text("Verka Sooji  Rusk ",style: TextStyle(color: MyColors.kColorBlack),),
                  SizedBox(height: size_5,),
                  const Text("Qty : 2",style: TextStyle(color: MyColors.kColorBlack),),
                  SizedBox(height: size_5,),
                  const Text("Price : 30 ",style: TextStyle(color: MyColors.kColorBlack),),
                ],
              ),

            ],
          ),
          Center(
            child: Column(
              children: [

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: size_10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                     Text("Confirm",style: TextStyle(fontSize: size_12),),
                    Text("dispatch",style: TextStyle(fontSize: size_12),),
                      Text("in transit",style: TextStyle(fontSize: size_12),),
                     Text("Out for\ndelivery",style: TextStyle(fontSize: size_12),),

                    Text("Delivered",style: TextStyle(fontSize: size_12),),

                  ],
                  ),
                ),
                SizedBox(height: size_5,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: size_15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_outline,color: MyColors.appColor,),
                    Expanded(
                      child: Container(height : size_2,
                       // width : size_60,
                        color : MyColors.appColor,),
                    ),
                    const Icon(Icons.check_circle_outline,color: MyColors.appColor,),
                    Expanded(
                      child: Container(height : size_2,

                        color : MyColors.appColor,),
                    ),
                      const Icon(Icons.check_circle_outline,color: MyColors.appColor,),
                      Expanded(
                        child: Container(height : size_2,

                          color : MyColors.appColor,),
                      ),
                      const Icon(Icons.check_circle_outline,color: MyColors.appColor,),
                    Expanded(
                      child: Container(height : size_2,
                        color : MyColors.appColor,),
                    ),
                      const Icon(Icons.check_circle_outline,color: MyColors.appColor,),
                  ],),
                ),
              ],
            ),
          )

        ],
      ),),);
  }
}
