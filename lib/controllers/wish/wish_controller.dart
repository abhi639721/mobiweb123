import 'package:get/get.dart';
import 'package:jump_q/data/network/apiservices/wish_api_services.dart';
import 'package:jump_q/helper/session.dart';
import 'package:jump_q/ui/view/commonwidget/snak_bar.dart';
import 'package:jump_q/ui/view/loginandsignup/login_page.dart';
import 'package:jump_q/utils/common_util.dart';
import '../../data/preferences/AppPreferences.dart';
import '../../models/dashboard/store_data.dart';
import '../../models/product/ProductData.dart';
import '../base_getx_controller.dart';

class WishListController extends BaseController{
  final apiServices = Get.put(WishApiServices());
  final session = Get.put(Session());
  final appPreferences = Get.find<AppPreferences>();
  List<ProductData> productDataList = [];
  List<StoreData> storeList = <StoreData>[];
  final isLoader = true.obs;
  final isStoreLoader = true.obs;
  WishListController();
  void callWishListApi()async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value=true;
    final response = await apiServices.wishListApi(appPreferences.authToken);
    isLoader.value=false;
    if(response == null) const SnakBar(message: "Server error");
    if(response!=null && response.status){
      productDataList=response.productData??[];
    }else{
      LogInScreen.start();
      productDataList=[];

    }

  }
  void callStoreWishListApi()async {
    isStoreLoader.value=true;
    final response = await apiServices.storeWishListApi(appPreferences.authToken);
    isStoreLoader.value=false;
    if(response == null) const SnakBar(message: "Server error");
    if(response!=null && response.status){
      storeList.clear();
      storeList=response.data??[];
    }else{
     Common.showToast("Something went wrong!");
      storeList=[];
    }

  }
  void callAddProductInWishListApi(String storeId,String storeProductId,)async {
    showLoader();
    final response = await apiServices.addWishProductApi(storeId,storeProductId,appPreferences.authToken);
   hideLoader();
    if(response == null) Common.showToast("Server Error");
    if(response!=null && !response.status){
    Common.showToast(response.message);
    }

  }
}