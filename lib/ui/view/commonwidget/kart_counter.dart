
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/utils/palette.dart';

class KartCounter extends StatelessWidget {
  const KartCounter({
    Key? key,
    required this.count,
  }) : super(key: key);

  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
       // height: 12,
       //  width: 12,
        decoration:
        BoxDecoration(color: MyColors.transparent, shape: BoxShape.circle),
        child: Center(
            child: Text(
              count ,
              style:  TextStyle(color: Palette.colorTextBlack, fontSize: size_15),
            )));
  }
}