//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:jump_q/models/dashboard/store_data.dart';
// import 'package:jump_q/services/navigator.dart';
// import 'package:jump_q/theme/my_theme.dart';
// import 'package:jump_q/ui/view/restaurants_view/restraunts_menu_view.dart';
// import 'package:jump_q/ui/widget/ratting.dart';
// import 'package:unicons/unicons.dart';
//
// class RestaurantCard extends StatefulWidget {
//   final StoreData restaurantData;
//   const RestaurantCard({Key? key, required this.restaurantData}) : super(key: key);
//
//   @override
//   State<RestaurantCard> createState() => _RestaurantCardState();
// }
//
// class _RestaurantCardState extends State<RestaurantCard> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:(){
//        // navigateTo(RestaurantMenuScreen.routeName);
//
//
//         //Navigator.push(context, MaterialPageRoute(builder:(context)=>RestaurantMenuScreen() ));
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: size_12, vertical: size_5),
//         decoration: BoxDecoration(
//           color: MyColors.kColorWhite,
//           // borderRadius: BorderRadius.circular(15),
//           borderRadius: BorderRadius.only(topLeft: Radius.circular(size_15),bottomLeft: Radius.circular(size_15)),
//           boxShadow: const [
//             BoxShadow(
//               color: MyColors.appColor,
//               blurRadius: 0.1,
//               spreadRadius: 0.1,
//               offset: Offset(
//                 0.1,
//                 0.1,
//               ),
//             )
//           ],
//
//         ),
//         child: Row(
//           children: <Widget>[
//             ClipRRect(
//               borderRadius:BorderRadius.only(topLeft: Radius.circular(size_15),bottomLeft: Radius.circular(size_15)),
//               child: Hero(
//                 tag: 'assets/png/app_logo.png',
//                 child: Image(
//                   height: size_110,
//                   width: size_120,
//                   image: const AssetImage('assets/images/burger.jpg'),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.all(12.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       //widget.storeData.store_name,
//                       "Cameo Food Cafe",
//                       style: TextStyle(
//                         fontSize: size_15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     RatingStars(rating: 5),
//                     SizedBox(height: size_4),
//                     SizedBox(height: size_5,),
//                     Row(
//                       children: [
//                         Icon(UniconsLine.location_arrow,size: size_14,color: MyColors.appColor,),
//                         SizedBox(width: size_3,),
//                         Text(
//                           '100 mtr away',
//                           style: TextStyle(
//                             fontSize: size_12,
//                             //fontWeight: FontWeight.w600,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: size_5,),
//                     Row(
//                       children: [
//                         Icon(UniconsLine.location_pin_alt,size: size_15,color: MyColors.appColor,),
//                         SizedBox(width: size_2,),
//                         Text(
//                           "Mathura Utter Pradesh India ",
//                           style: TextStyle(
//                             fontSize: size_12,
//                             // fontWeight: FontWeight.w600,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: size_4),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
