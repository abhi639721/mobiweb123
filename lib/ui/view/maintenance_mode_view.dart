import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/primary_elevated_button.dart';

class MaintenanceModeView extends StatefulWidget {
  static String routeName = "/MaintenanceModeView";

  static Future<bool?> start<bool>() {
    return navigatePlacementNamedl<bool>(routeName,);
  }

  const MaintenanceModeView({Key? key}) : super(key: key);

  @override
  State<MaintenanceModeView> createState() => _MaintenanceModeViewState();
}

class _MaintenanceModeViewState extends State<MaintenanceModeView> {

    @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: MyColors.restrauntBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/png/Maintance.png",height: size_200,),
            Text("",style: GoogleFonts.poppins(
              fontSize: size_30,
              fontWeight: FontWeight.bold,
            ),),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'We’ll be back.\n',
                style: GoogleFonts.poppins(
                  color: MyColors.kColorBlack,
                  fontSize: size_30,
                  fontWeight: FontWeight.bold,
                ),
                children:  <TextSpan>[
                  TextSpan(text: 'We’re busy updating the', style: GoogleFonts.poppins( fontSize: size_15,
                    fontWeight: FontWeight.w600,color: MyColors.kColorBlack900,) ),
                  TextSpan(text: ' JUMP Q',style:GoogleFonts.poppins(
                    fontSize: size_16,
                    color: MyColors.appColor.shade900,
                    fontWeight: FontWeight.bold,
                  )),
                  TextSpan(text: ' for you.\n Please check back soon,',style:GoogleFonts.poppins(
                    fontSize: size_15,
                    color: MyColors.kColorBlack900,
                    fontWeight: FontWeight.bold,
                  )),
                ],
              ),
            ),

            // Text(" We’re busy updating the JUMP Q for you.\n Please check back soon,",
            //   textAlign:TextAlign.center,style: GoogleFonts.poppins(
            //   fontSize: size_15,
            //   fontWeight: FontWeight.w600,
            // ),),
          SizedBox(height: size_30,),
          SizedBox(
            height: size_40,
            width: size_200,
            child: PrimaryElevatedBtn(
                "OK",
                  ()=> SystemNavigator.pop(), borderRadius: size_30,
              textStyle:TextStyle(fontSize:size_16,fontWeight: FontWeight.bold),),
          ),


          ],
        )),

    ));
  }
}
