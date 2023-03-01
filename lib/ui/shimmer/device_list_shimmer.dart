import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/shimmer/simmer_view.dart';


import 'package:flutter/material.dart';

class DeviceListShimmer extends StatelessWidget {
  const DeviceListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(itemBuilder: (ctx,index){
        return Container(
          padding: EdgeInsets.all(size_14),
          decoration: BoxDecoration(
            color: MyColors.fillColor,
            borderRadius: BorderRadius.circular(size_12),

          ),
          child: Row(
            children: <Widget>[
              getShimmerView(width: size_48,height: size_48,radius: size_24),
              SizedBox(width: size_18,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     getShimmerView(width: size_130,height: size_24,radius: size_2),
                     SizedBox(height: size_12,),
                     getShimmerView(width: size_130,height: size_18,radius: size_2),
                   ],
                ),
              ),
              SizedBox(width: size_18,),
              getShimmerView(width: size_30,height: size_30,radius: size_15),
            ],
          ),
        );
      }, separatorBuilder: (ctx,index)=>SizedBox(height: size_12,), itemCount: 12),
    );
  }
}
