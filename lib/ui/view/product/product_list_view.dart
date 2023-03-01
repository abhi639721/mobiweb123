


import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/product/product_controller.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/commonwidget/product_card.dart';
import 'package:jump_q/utils/palette.dart';

class ProductListView extends AppPageWithAppBar {
  static String routeName = "/productListView";
  ProductListView({Key? key}) : super(key: key);
  static Future<bool?> start<bool>(String title, {categoryId, storeId}) {
    return navigateTo<bool>(routeName,
        currentPageTitle: title,
        arguments: {'categoryId': categoryId, 'storeId': storeId});
  }
  final controller = Get.put(ProductController());
  final int page = 0;
  scrollUpdate(){
    controller.callProductListApi(
        barcode: "",
        storeId: arguments['storeId'],
        categoryId: arguments['categoryId'],
        page: page);
  }

@override
  Widget build(BuildContext  context){
  controller.callProductListApi(
      barcode: "",
      storeId: arguments['storeId'],
      categoryId: arguments['categoryId'],
      page: page);

  return Scaffold(
    appBar: AppBar(backgroundColor: MyColors.kColorWhite,foregroundColor: MyColors.kColorBlack,
    title: const Text("All Product"),),
    body:
    // controller.isLoader.value
    //      ? const Loader()
    //      :
    Column(
      children: [
        SizedBox(height: size_15,),
        searchView,
       Obx(()=> Expanded(child: Container(child: gridViewList))),
      ],
    ),
  );
  }


  Widget get gridViewList{
    return GridView.builder(
      itemCount: controller.productDataList.length,
        shrinkWrap: true,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.1,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: size_1,
          mainAxisExtent: size_265,
        ), itemBuilder: (ctx,i){
      return  AnimationConfiguration.staggeredGrid(
          columnCount: 2,
          position: i,
          duration: const Duration(milliseconds: 500),
          child:  ScaleAnimation(
              child: FadeInAnimation(
                  delay: const Duration(milliseconds: 200),
                  child: ProductCard(product: controller.productDataList[i],)
          )

          ));
        //ProductCard(product: list[i],);

    });
  }



  Widget get searchView {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: 45,
        decoration: BoxDecoration(
          color: MyColors.kColorWhite,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 1,
              color: Colors.grey.withOpacity(0.50),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: (value) {
                  if(value.length>5) {
                    controller.callSearchProductListApi(searchKey: value);
                  }
                },
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
    );
  }

}