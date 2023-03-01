import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jump_q/ui/view/base/base_satateless_widget.dart';
import 'package:jump_q/ui/view/home/tab/dashboard/super_market_list_card.dart';

import '../../../../../controllers/home/home_controller.dart';
import '../../../../../theme/my_theme.dart';
import '../../../../../utils/palette.dart';

class HomeStoreList extends BaseStateLessWidget{
  final HomeStoreController homeStoreController ;
  HomeStoreList(this.homeStoreController);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          searchBarBox,
          SizedBox(
            height: screenHeight,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 12, right: 12,bottom: 220),
                itemCount: homeStoreController.storeList.length,
                itemBuilder: (context, int index) {
                  return SuperMarketListCard(
                      storeData: homeStoreController.storeList[index]);
                }),
          ),

        ],
      ),
    );
  }
  Widget get searchBarBox {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8),
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 0),
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          height: 45,
          decoration: BoxDecoration(
            color: MyColors.kColorWhite,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 1,
                color: Colors.grey.withOpacity(0.50),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    fillColor: MyColors.transparent,
                    filled: true,
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: MyColors.kColorBlack500,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Palette.appColor,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}