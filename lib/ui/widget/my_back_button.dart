// import 'package:flutter/material.dart';
// import 'package:insure_investments/theme/my_theme.dart';
//
// class MyBackButton extends StatelessWidget {
//   final Function()? onBackPress;
//   final bool withContainer;
//   final Color? iconColor;
//   const MyBackButton({this.onBackPress,this.withContainer=true,this.iconColor,Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: InkWell(
//         onTap: (){
//
//         },
//         child: Container(
//           padding: EdgeInsets.all(size_6),
//           decoration: !withContainer?const BoxDecoration():const BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 offset: Offset(1,1),
//                 color: MyColors.kColorBlack300,
//                 blurRadius: 3
//               )
//             ]
//           ),
//             child: Icon(Icons.arrow_back_ios_rounded,color: iconColor??MyColors.kColorBlack,size: withContainer?size_14:size_24,))),
//     );
//   }
// }
//
// Widget  iOSBackButton({ Function? onBackPress,Color? color,EdgeInsets? padding,double size = 24,bool withContainer = false}) => InkWell(onTap: onBackPress==null?goBack:()=>onBackPress(), child: Container(
//       padding: padding??EdgeInsets.all(size_4),
//       decoration: !withContainer?BoxDecoration():BoxDecoration(
//         color: Colors.white12,
//         shape: BoxShape.circle,
//       ),
//     child: Icon(Icons.arrow_back_ios_rounded,color: color??MyColors.appColor,size: size,)));
