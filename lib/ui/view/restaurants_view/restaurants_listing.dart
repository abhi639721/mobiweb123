import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/restraunt_controllers/restaurant_home_controller.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/shimmer/restaurant_list_shimmer.dart';
import 'package:jump_q/ui/view/restaurants_view/restraunts_menu_view.dart';
import 'package:jump_q/ui/widget/ratting.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unicons/unicons.dart';
import '../../../models/restaurant_model/Data.dart';

class RestaurantsListView extends StatefulWidget {
  static String routeName = "/RestaurantsListView";
  const RestaurantsListView({Key? key}) : super(key: key);
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(
      routeName,
      currentPageTitle: "RestaurantsListView",
    );
  }
  @override
  State<RestaurantsListView> createState() => _RestaurantsListViewState();
}

class _RestaurantsListViewState extends State<RestaurantsListView> {

  final restaurantController = Get.put(RestaurantController());
   final appPreferences = Get.find<AppPreferences>();


  bool isLoader = true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //isLoader = true;
   callApi();
   // isLoader =false;
  }
  final progres = ProgressIndicator;
  void callApi(){

  restaurantController.callHomeRestaurantApi("534", "342");
   isLoader =false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.restrauntBgColor,
      //backgroundColor: MyColors.kColorLightWhite,
      body: RefreshIndicator(
        onRefresh: () async {
      await Future.delayed(const Duration(seconds: 1));
      return callApi();
    },
    child: cardList,
      )
    );
  }


 Widget get cardList{
  return Obx(() =>(restaurantController.isLoader.value)?RestShimmer()
    : ListView.builder(
        itemCount: restaurantController.searchRestaurantList.length, itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(

          position: index,
          duration: const Duration(milliseconds: 500),
          child: SlideAnimation(
            //horizontalOffset: 100.0,
            //
            verticalOffset: 100.0,
            child: FadeInAnimation(
              child: restaurantsCard(restaurantController.searchRestaurantList[index])
            ),
          ),
        );






      },),
  );
 }




  Widget restaurantsCard(Data restData ){
    return  GestureDetector(
      onTap:(){
        appPreferences.saveRestaurantId(restData.restaurantId.toString());
        Navigator.push(
          context,
          PageTransition(

            type: PageTransitionType.rightToLeftWithFade,
            alignment: Alignment.bottomRight,
            child: RestaurantMenuScreen(restaurantId: restData.restaurantId.toString(),),
          ),
        );


      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size_12, vertical: size_5),
        decoration: BoxDecoration(
          color: Colors.white,
           // borderRadius: BorderRadius.circular(15),
         borderRadius: BorderRadius.only(topLeft: Radius.circular(size_15),bottomLeft: Radius.circular(size_15)),
          boxShadow: const [
             BoxShadow(
              color: MyColors.appColor,
              blurRadius: 0.1,
              spreadRadius: 0.1,
              offset: Offset(
                0.1,
                0.1,
              ),
            )
          ],

        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: size_110,
              width: size_120,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(size_15),bottomLeft: Radius.circular(size_15)),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/png/app_logo.png',
                      image: restData.image.toString(),
                        height: size_110,
                        width: size_120,
                        fit: BoxFit.fill,
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [

                  Container(
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Name
                        Text( restData.restaurantName.toString(),
                          //"Cameo Food Cafe",
                          style: TextStyle(
                            fontSize: size_15,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        ///ratting star
                        SizedBox(height: size_5),
                        RatingStars(rating: restData.ratings!.toInt()),

                        SizedBox(height: size_5,),
                        ///address
                        Row(
                          children: [
                            Icon(UniconsLine.location_pin_alt,size: size_15,color: MyColors.appColor,),
                            SizedBox(width: size_2,),
                            SizedBox(
                              width: size_150,
                              child: Text(
                                restData.address.toString(),
                                style: TextStyle(
                                  fontSize: size_12,
                                  // fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size_5,),
                        ///distance
                        Row(
                          children: [
                            Icon(UniconsLine.location_arrow,size: size_14,color: MyColors.appColor,),
                            SizedBox(width: size_3,),
                            Text(
                              '100 mtr away',
                              style: TextStyle(
                                fontSize: size_12,
                                //fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),

                        SizedBox(height: size_4),
                      ],
                    ),
                  ),
                  ///status for closed restaurant
                  if(restData.openStatus == 'Close')
                    Positioned(
                      right: size_10,
                        child: Image.asset("assets/png/closed.png",height: size_50,width: size_50,))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
