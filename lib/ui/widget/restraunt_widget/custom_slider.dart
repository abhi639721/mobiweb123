



import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';

class CustomSlider extends StatelessWidget {
  final double percentage;

  const CustomSlider({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size_150,
      height:  MediaQuery.of(context).size.height / size_96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: MyColors.kColorGrey
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  MyColors.appColor
            ),
            width: (percentage / size_100) * size_154,
          ),
        ],
      ),
    );
  }
}
