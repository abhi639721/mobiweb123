



import 'package:get/get.dart';
import 'package:jump_q/controllers/base_getx_controller.dart';
import 'package:jump_q/data/network/restaurant_apiservices/restaurant_home_api_services.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/models/restaurant_model/cat/MenuCategories.dart';
import 'package:jump_q/models/restaurant_model/cat/RestaurantMenus.dart';
import 'package:jump_q/models/restaurant_model/cat/Restaurant_menu_model.dart';
import 'package:jump_q/utils/common_util.dart';

import '../../models/restaurant_model/cat/Details.dart';


class RestaurantDetailController extends BaseController{
  final apiServices = Get.put(RestaurantHomeApiServices());
  final session = Get.put(Session());
  List<RestaurantMenus> restaurantMenus = [];
  List<MenuCategories> menuCategories = [];
  late Details details;
  RestaurantMenuModel? restaurantManuModel;
  final isLoader = true.obs;
  RestaurantDetailController();
  void callRestaurantDetailApi(int page, String restaurantId)async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value=true;
    final response = await apiServices.restaurantDetailApi(authToken: SharedConfig.authToken, page: page, restaurantId: restaurantId);
    isLoader.value=false;
    print("response ==${response}");
    if(response == null) {
      Common.showToast("Server error!") ;
      return;
    }

    try{
      if(response.status!=false){
        restaurantManuModel =response;
        if(restaurantManuModel!.data!=null && restaurantManuModel!.data!.restaurantMenus!.isNotEmpty){
          restaurantMenus =restaurantManuModel!.data!.restaurantMenus!.cast<RestaurantMenus>();
        }

        if(restaurantManuModel!.data!=null && restaurantManuModel!.data!.details !=null){
          details = restaurantManuModel!.data!.details!;
       }
        if(restaurantManuModel!.data!=null && restaurantManuModel!.data!.menuCategories !=null){
          menuCategories = restaurantManuModel!.data!.menuCategories!;
        }

        // if(storeDetailModel.data!=null && storeDetailModel.data!.categories!.isNotEmpty){
        //   categories =storeDetailModel.data!.categories!;
        //
        // }



        // if(restaurantManuModels.data!=null && restaurantManuModels.data!.details !=null){
        //   details =restaurantManuModels.data!.details!;
        // }

        // if(storeDetailModel.data!=null && storeDetailModel.data!.offers !=null){
        //   offers =storeDetailModel.data!.offers!;
        //
        // }

      }else{
       // print("object");
        Common.showToast("message: restaurantManuModels.message") ;
       // SnakBar("message: restaurantManuModels.message");
      }
    }catch (e){
      print(e.toString());
    }
  }


}
