import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
class RatingStars extends StatelessWidget {
  final int rating;
  RatingStars({required this.rating});
  @override

  Widget build(BuildContext context) {
    String stars="";
    for(int i=0;i<rating;i++){
      stars+='⭐ ';
    }
    return Text(stars,style: TextStyle(color: MyColors.appColor, fontSize: size_12),);
  }
}
