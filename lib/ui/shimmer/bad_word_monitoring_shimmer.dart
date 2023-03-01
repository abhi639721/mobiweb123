import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/shimmer/simmer_view.dart';
import 'package:flutter/material.dart';

class LibraryBadWordShimmer extends StatelessWidget {
  const LibraryBadWordShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(12, (index) =>  AnimatedContainer(
          duration: Duration(milliseconds: 500),
          margin: EdgeInsets.symmetric(vertical: size_6),
          padding: EdgeInsets.symmetric(horizontal: size_14,vertical: size_8),
          decoration: BoxDecoration(
            color: MyColors.fillColor,
            borderRadius: BorderRadius.circular(size_12),
          ),
          child: Row(
            children: [
              getShimmerView(width: size_36,height: size_36,radius: size_20),
              SizedBox(width: size_12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getShimmerView(width: size_200,height: size_16,radius: size_15),
                    SizedBox(height: size_4,),
                    getShimmerView(width: size_100,height: size_16,radius: size_15),
                  ],
                ),
              ),
              SizedBox(width: size_8,),
              getShimmerView(child: Icon(Icons.keyboard_arrow_right_rounded)),
            ],
          ),
        )),
      ),
    );
  }
}


class AddedBadWordShimmer extends StatelessWidget {
  final int length;
  const AddedBadWordShimmer({this.length = 6, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        spacing: size_12,
        runSpacing: size_10,
        children: List.generate(length, (index) => Container(
          padding: EdgeInsets.symmetric(horizontal: size_6,vertical: size_4),
          decoration: BoxDecoration(
            color: MyColors.fillColor,
            borderRadius: BorderRadius.circular(size_20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: size_4,),
              getShimmerView(width: size_60,height: size_16,radius: size_15),
              SizedBox(width: size_6,),
              Container(
                  padding: EdgeInsets.all(size_4),
                  decoration: BoxDecoration(
                    color:MyColors.kColorWhite,
                    shape: BoxShape.circle,
                  ),
                  child: getShimmerView(
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: size_14,
                        color:MyColors.kColorGrey,),
                    ),
                  ))
            ],
          ),
        )).toList(),
      ),
    );
  }
}
