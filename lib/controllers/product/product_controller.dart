
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/ui/view/commonwidget/snak_bar.dart';
import 'package:jump_q/utils/common_util.dart';
import '../../data/network/apiservices/product_api_services.dart';
import '../../data/preferences/AppPreferences.dart';
import '../../models/product/ProductData.dart';
import '../../notifire/kart_notifire.dart';
import '../../ui/view/qr_scanner_option/botttum_sheet.dart';
import '../base_getx_controller.dart';

class ProductController extends BaseController{
  final apiServices = Get.put(ProductApiServices());
  final appPreferences = Get.find<AppPreferences>();
  final NotificationNotifer notifierController =
  Get.find<NotificationNotifer>();
  final productDataList =<ProductData>[].obs;
  final productDataSetList =<ProductData>[].obs;
  final isLoader = true.obs;
  final pageOffSet = true.obs;
  final pageNo=0.obs;

  ProductController();

  void callProductListApi({barcode:"",storeId:"",categoryId,page})async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    pageNo.value==0?isLoader.value=true:isLoader.value=false;
    final response = await apiServices.productListApi(barcode: barcode,storeId: storeId,categoryId: categoryId,page:page);
    isLoader.value=false;
    if(response == null) const SnakBar(message: "Server error");
    if(response!=null && response.status && response.productData!.isNotEmpty){
      pageNo.value+=1;
      productDataList.addAll(response.productData??[]);
      productDataSetList.addAll(response.productData??[]);

    }else{
      pageOffSet.value=false;
    }

  }
  void callSearchProductListApi({searchKey})async {

    showLoader();
    productDataSetList.clear();
    final response = await apiServices.searchListApi(search:searchKey);
    hideLoader();
    if(response == null){
      Common.showToast("Server error!");
      productDataSetList.addAll(productDataList);
    }
    if(response!=null && response.status && response.productData!.isNotEmpty){
      productDataSetList.addAll(response.productData??[]);
    }else{
      productDataSetList.addAll(productDataList);
    }

  }


  Future<ProductData?> callProductDetailApi({barcode:"",storeId:"",categoryId,page,context,kartController})async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return null;
    }
   showLoader();
    final response = await apiServices.productListApi(barcode: barcode,storeId: storeId,categoryId: categoryId,page:page);
   hideLoader();
    if(response == null) const SnakBar(message: "Server error");
    if(response!=null && response.status && response.productData!.isNotEmpty){
      showModalBottomSheet(


        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,


        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
          child: Container(

            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),


            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BottomSheetBar(barcode:barcode,productData:response.productData![0],kartController: kartController),
          ),
        ),
      );
      return response.productData![0];

    }
    return null;

  }
}