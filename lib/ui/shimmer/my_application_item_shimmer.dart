import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/shimmer/simmer_view.dart';

class MyApplicationItemShimmer extends StatelessWidget {
  const MyApplicationItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size_12),
      ),
      child: Container(
        padding:  EdgeInsets.all(size_12),
        child: Column(children: [
          Row(
            children: [
              getShimmerView(height: size_50,width: size_50,radius: size_25,border: Border.all(color: MyColors.appColor, width: 3)),
              SizedBox(width: size_8,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getShimmerView(height: size_18,radius: size_2),
                    SizedBox(height: size_6),
                    getShimmerView(height: size_18,radius: size_2,width: size_150),
                    SizedBox(height: size_6),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size_8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getShimmerView(height: size_18,radius: size_2,width: size_100),
              getShimmerView(height: size_18,radius: size_2,width: size_100),
            ],),
          SizedBox(height: size_8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getShimmerView(height: size_30,radius: size_4,width: size_100),
              getShimmerView(height: size_30,radius: size_4,width: size_100),
            ],
          )
        ]),
      ),
    );
  }
}
