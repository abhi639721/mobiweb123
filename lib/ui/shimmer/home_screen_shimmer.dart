
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/shimmer/simmer_view.dart';
import 'package:jump_q/ui/view/base/base_satateless_widget.dart';


class StoreCardShimmer extends BaseStateLessWidget {
  const StoreCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size_60,

          decoration: BoxDecoration(
              color: MyColors.restrauntBgColor,

              border: Border(bottom: BorderSide(width: 1.0,color: MyColors.kColorGrey))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Row(
              children: [ getShimmerView(height: size_18,width: size_20,borderRadius: BorderRadius.all(Radius.circular(5))),
                SizedBox(width: size_10,),
              getShimmerView(height: size_20,width: size_100,borderRadius: BorderRadius.all(Radius.circular(15))),],),
              Row(
                children: [ getShimmerView(height: size_15,width: size_20,borderRadius: BorderRadius.all(Radius.circular(5))),
                  SizedBox(width: size_10,),
                  getShimmerView(height: size_20,width: size_100,borderRadius: BorderRadius.all(Radius.circular(15))),],)

          ],),
        ),
        Padding(padding: EdgeInsets.only(left: size_8,right: size_8,top: size_10,bottom: size_5),
        child: getShimmerView(height: size_50,width: double.maxFinite,borderRadius: BorderRadius.all(Radius.circular(15))),),

        Expanded(
          child: ListView.builder(
          itemCount: 10,

              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
               // height: 280,

                decoration: BoxDecoration(
                    color: MyColors.restrauntBgColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    border: Border.all(width: 1.0,color: MyColors.kColorGrey,)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    getShimmerView(   width: double.maxFinite,
                      height: size_150,borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)), ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getShimmerView(height: size_20,width:screenWidget/3,borderRadius: BorderRadius.all(Radius.circular(15))),
                              getShimmerView(height: size_20,width:size_50,borderRadius: BorderRadius.all(Radius.circular(4)))
                            ],),
                          SizedBox(height: size_8,),
                          getShimmerView(height: size_16,width:screenWidget/1.5,borderRadius: BorderRadius.all(Radius.circular(15))),
                          SizedBox(height: size_8,),
                          getShimmerView(height: size_16,width:screenWidget/2,borderRadius: BorderRadius.all(Radius.circular(15))),
                          SizedBox(height: size_8,),
                          getShimmerView(height: size_16,width:screenWidget/3.5,borderRadius: BorderRadius.all(Radius.circular(15))),

                        ],),
                    )


                  ],),
              ),
            );
          }

          ),
        ),
      ],
    );
  }
}





class HomeSliderShimmerView extends StatelessWidget {
  const HomeSliderShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // autoPlay: false,
      // height: size_150,
      // itemList: List.generate(4, (index) => index),
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context ,index){
        return getShimmerView(width:double.maxFinite,height: 50,radius: size_10);
      },
    );
  }
}

class HomeTopShimmerView extends StatelessWidget {
  const HomeTopShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: size_24),
      scrollDirection: Axis.horizontal,
      itemCount: 12,
      separatorBuilder: (BuildContext context, int index) =>SizedBox(width: size_12,),
      itemBuilder: (BuildContext context, int index) =>getShimmerView(width:size_200,radius: size_10,height: size_150),
    );

  }

}
class HomeTopWrapShimmerView extends StatelessWidget {
  const HomeTopWrapShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: size_10,
      runSpacing: size_5,
      // alignment: WrapAlignment.spaceBetween,
      children: List.generate(12, (index) => index).map((e) => Container(
        child: getShimmerView(width:size_70,radius: size_5,height: size_24),
      )).toList(),
    );

  }

}