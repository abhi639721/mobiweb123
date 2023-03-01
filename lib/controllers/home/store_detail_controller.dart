import 'package:get/get.dart';

import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/models/dashboard/storeDetail.dart';
import 'package:jump_q/models/product/ProductData.dart';

import 'package:jump_q/ui/view/commonwidget/snak_bar.dart';

import 'package:jump_q/utils/common_util.dart';
import '../../data/network/apiservices/home_api_services.dart';
import '../../data/preferences/AppPreferences.dart';
import '../../models/dashboard/Category.dart';
import '../../models/dashboard/Details.dart';
import '../../models/dashboard/Offer.dart';
import '../../models/dashboard/Topdeal.dart';

import '../base_getx_controller.dart';

class StoreDetailController extends BaseController{
  final apiServices = Get.put(HomeApiServices());
  final session = Get.put(Session());
  final appPreferences = Get.find<AppPreferences>();
  List<Topdeal> topdeals =[];
  List<Category> categories = [];
  List<ProductData> storeProducts = [];
  List<Offer>? offers=[];
  Details? details;
  late  StoreDetailModel storeDetailModel;
  final isLoader = true.obs;
  StoreDetailController();
  void callStoreDetailApi(int page, String storeId)async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value=true;
    final response = await apiServices.storeDetailApi(authToken: SharedConfig.authToken, page: page, store_id: storeId);
    isLoader.value=false;
    if(response == null) {
      Common.showToast("Server error!") ;
      return;
    }
      try{
        if(response.status){
          storeDetailModel=response;
          if(storeDetailModel.data!=null && storeDetailModel.data!.topdeals!.isNotEmpty){
            topdeals =storeDetailModel.data!.topdeals!;

          }
          if(storeDetailModel.data!=null && storeDetailModel.data!.categories!.isNotEmpty){
            categories =storeDetailModel.data!.categories!;

          }
          if(storeDetailModel.data!=null && storeDetailModel.data!.storeProducts!.isNotEmpty){
            storeProducts =storeDetailModel.data!.storeProducts!;

          }
          if(storeDetailModel.data!=null && storeDetailModel.data!.details !=null){
            details =storeDetailModel.data!.details!;

          }
          if(storeDetailModel.data!=null && storeDetailModel.data!.offers !=null){
            offers =storeDetailModel.data!.offers!;

          }


        }else{
          SnakBar(message: response.message);
        }
      }catch (e){
        print(e.toString());
      }
    }


  }
