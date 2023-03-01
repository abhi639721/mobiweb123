import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jump_q/models/payment/Data.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/base/page.dart';
import '../../../../controllers/kart/KartController.dart';

import '../../../../data/preferences/AppPreferences.dart';
import '../../../../notifire/kart_notifire.dart';
import '../../../../services/navigator.dart';
import '../../home/home.dart';

class PaymentComplete extends AppPageWithAppBar {
  final kartController = Get.put(KartController());
  final appPreferences = Get.find<AppPreferences>();
  final NotificationNotifer notifierController =
      Get.find<NotificationNotifer>();
  static String routeName = "/paymentcomplete";

  PaymentComplete({Key? key}) : super(key: key);
  static Future<bool?> start<bool>(Data? data,bool status) {
    return navigateTo<bool>(routeName, currentPageTitle: "Payment Complete",
        arguments: {"data":data,"status":status}
        );
  }
  @override
  Widget get body  {
    Data? storeData=arguments['data'];
    return Builder(
        builder: (oderId)=> Column(
          children: [
            ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                    height: 100,
                    color: MyColors.appColor,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Payment",
                            style: GoogleFonts.oswald(
                              textStyle: TextStyle(color: MyColors.kColorLightWhite,
                                  fontSize: size_30, fontWeight: FontWeight.w500),
                            ),
                            //Text("Payment\nComplete")),
                          ),
                          Text(
                            arguments['status']?"Complete":"Opps something went wrong!",
                            style: GoogleFonts.oswald(
                              textStyle: TextStyle(color: MyColors.kColorLightWhite,
                                  fontSize: size_30, fontWeight: FontWeight.w500),
                            ),
                            //Text("Payment\nComplete")),
                          ),
                        ],
                      ),
                    ))),
            const SizedBox(height: 30,),
            statusIcon,
            const SizedBox(height: 30,),
            orderAmount(storeData),
            const SizedBox(height: 30,),
            const Text("Paid To",style:  TextStyle(color: MyColors.appColor,fontSize: 16,fontWeight: FontWeight.w600),),
            const SizedBox(height: 30,),
            store(storeData),
            const SizedBox(height: 30,),
            const Text("Bill Number", style :  TextStyle(color: MyColors.appColor,fontSize: 16,fontWeight: FontWeight.w600),),
            orderNumber(storeData),
            const SizedBox(height: 30,),
            doneButton,
            const SizedBox(height: 30,),
            shereRecipt
          ],
        ),);

  }

  Widget get statusIcon{
    return   Container(
      height: 110,
      width: 110,
      decoration:  BoxDecoration(
          color: arguments['status']? MyColors.kColorBlue:MyColors.kColorRed,
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child:  Padding(
        padding: EdgeInsets.all(8.0),
        child:  Icon(arguments['status']?Icons.check:Icons.cancel_rounded,size: 50,color: MyColors.kColorWhite),
        // ImageIcon(
        //   AssetImage("assets/png/check.png"),
        //   color: MyColors.kColorWhite,
        // ),
      ),
    );
  }

  Widget orderAmount(storeData){
    return Text("${storeData?.amount??"0"}",style: const TextStyle(color: MyColors.appColor,fontSize: 35,fontWeight: FontWeight.w600),);

  }

  Widget orderNumber(storeData){
    return Text(storeData?.orderNo??"0", style :  TextStyle(color: MyColors.kColorGrey,fontSize: 14,fontWeight: FontWeight.w600),);

  }
  Widget  store(Data? data){
    return Center(
      child: Row(
        children: [
          const SizedBox(width: 100,),
          storeImage(data),
          const SizedBox(width: 10,),
          storeName(data)
        ],),
    );
  }

  Widget storeImage (Data? data){
    return Container(
      height: 50,
      width: 50,
      decoration:  BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(data?.storeImage??"")),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      // child: Image.asset('assets/images/ah.jpg')
    );
  }
  Widget storeName(Data? data){
    return  Column(
      children:  [
        Text(data?.storeName??"",style: const TextStyle(color: MyColors.appColor,fontSize: 14,fontWeight: FontWeight.w600),),
        const SizedBox(height: 5,),
        //Text(data?.storeImage??"",textAlign: TextAlign.left,style: TextStyle(color: MyColors.kColorGrey,fontSize: 12,fontWeight: FontWeight.w600,)),
      ],
    );
  }
  Widget get shereRecipt{

    return InkWell(
      child: const Text("Share ",style: TextStyle(color: MyColors.appColor,fontSize: 18,fontWeight: FontWeight.w900),),
      onTap: (){},
    );
  }
  Widget get doneButton {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            textStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w100, fontSize: 15)),
        onPressed: () {
          appPreferences.saveStoreId("0");
          Home.start("0");
        },
        child: const SizedBox(height: 50,
        width: double.infinity,
          child: Center(child: Text('Done',style:  TextStyle(color: MyColors.kColorWhite,fontSize: 18,fontWeight: FontWeight.w600))),),
      ),
    );
  }
}
