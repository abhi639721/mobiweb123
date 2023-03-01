import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/shimmer/simmer_view.dart';
import 'package:jump_q/ui/view/base/base_satateless_widget.dart';

class RestShimmer extends BaseStateLessWidget {
   RestShimmer({Key? key}) : super(key: key);

  // bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context,index){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: size_12, vertical: size_5),
        decoration: BoxDecoration(
          color: MyColors.kColorWhite,
          // borderRadius: BorderRadius.circular(15),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(size_15),bottomLeft: Radius.circular(size_15)),


        ),
        child: Row(
          children: <Widget>[
            getShimmerView(
              height: size_110,
              width: size_120,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(size_15),bottomLeft: Radius.circular(size_15)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  getShimmerView(height: size_16,width: screenWidget/3,borderRadius: BorderRadius.circular(20)),
                  SizedBox(height: size_5,),
                  getShimmerView(child:Text("⭐⭐⭐⭐⭐"), height: size_14,width: screenWidget/3,borderRadius: BorderRadius.circular(20)),
                  SizedBox(height: size_5,),
                  getShimmerView(height: size_13,width: screenWidget/2,borderRadius: BorderRadius.circular(20)),
                  SizedBox(height: size_5,),
                  getShimmerView(height: size_13,width: screenWidget/3,borderRadius: BorderRadius.circular(20)),

                ],),
            )

          ],
        ),
      );
    });
  }
}
