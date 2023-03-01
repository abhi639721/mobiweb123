import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/commonwidget/product_card.dart';
import 'package:jump_q/ui/view/product/product_list_view.dart';
import 'package:jump_q/utils/common_util.dart';
import '../../../../../controllers/home/store_detail_controller.dart';
import '../../../../../data/preferences/AppPreferences.dart';
import '../../../../../services/navigator.dart';
import '../../../../../utils/palette.dart';
import '../../../qr_scanner_option/product_scanner.dart';
import '../../../dialog/loader.dart';
import 'image_carousel.dart';
import 'package:jump_q/ui/view/commonwidget/text_style.dart';

class StoreDetailPage extends AppPageWithAppBar {
  static String routeName = "/storeDetailPage";
  final appPreferences = Get.find<AppPreferences>();
  final storeDetailController = Get.put(StoreDetailController());

  StoreDetailPage({Key? key}) : super(key: key);



  static Future<bool?> start<bool>( String storeName) {
    return navigateTo<bool>(routeName,
        currentPageTitle: storeName,);
  }
  final _scrollController = ScrollController();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget get body {
    storeDetailController.callStoreDetailApi(
         1, appPreferences.storeId);
    return Obx(() => (storeDetailController.isLoader.value)
        ?  Loader()
        :  RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          return ;
        },
        child:
    SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  /* topRow(context),*/
                  const SizedBox(
                    height: 10,
                  ),
                  searchView(Get.context!),

                  if (storeDetailController.topdeals.isNotEmpty)
                    Carousel(
                        topdeal: storeDetailController
                            .storeDetailModel.data!.topdeals!),
                  categoryList,
                  productSeeAll,
                  //productList,
                 // categoryServices,

                 // if (storeDetailController.categories.isNotEmpty)
                  ProductListServices
                ],
              ),
            ),
          )));
  }

  Widget searchView(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      child: Padding(padding: EdgeInsets.only(right: 5),child: TextField(
        enabled: true,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search,color: Palette.appColor),
          suffixIcon: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      QrCodeScanPage(storeId: appPreferences.storeId),
                )),
            icon: const ImageIcon(
              AssetImage('assets/png/barcode.png'),
              color: Palette.appColor,
              size: 50,
            ),
          ),
          hintText: 'Product,Category',
          border: InputBorder.none,
        ),
      ),),
    );
  }

  Widget get productSeeAll {
    return Padding(
      padding:  EdgeInsets.only(top: size_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Product Tour",
            style: TextStyles.headingText(),
          ),
          InkWell(
            onTap: () {
              ProductListView.start("All Product",
                  storeId: storeDetailController.categories[0].storeId);
            },
            child: Text(
              "See All >>",
              style: TextStyles.headingText(color: Palette.appColor),
            ),
          )
        ],
      ),
    );
  }

  Widget get categoryList {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: size_110,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              storeDetailController.categories.length,
              (i) => categoryCard(i)),
        ),
      ),
    );
  }
Widget  categoryCard(int index){
    return InkWell(
      onTap: () {
        ProductListView.start(
            storeDetailController.categories[index].categoryName,
            categoryId:
            storeDetailController.categories[index].categoryId,
            storeId: storeDetailController.categories[index].storeId);
      },
      child: Container(
        width: screenWidget/5,
          margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            SizedBox(
              height: size_48,
              width: size_48,
              child: CircleAvatar(
                radius: screenWidget / 8,
                backgroundImage: NetworkImage(
                    storeDetailController.categories[index].categoryImage,),
              ),
            ),
            SizedBox(height: 8,),
            categoryName(
                storeDetailController.categories[index].categoryName),
          ],
        ),
      ),
    );
}
  Widget get productList {
    return Padding(
      padding:  EdgeInsets.only(top: size_20),
      child: Container(
       // width: screenWidget,
        height: screenHeight / 3,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            storeDetailController.storeProducts.length,
            (i) => Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
              width: screenWidget / 2,
              child: ProductCard(product: storeDetailController.storeProducts[i]),
            ),
          ),
        ),
      ),
    );
  }
  Widget gridviewWidget(int index) {
    return Center(
      child: GridView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: storeDetailController.storeProducts.length,
        itemBuilder: (ctx, i) {
          return ProductCard(product:storeDetailController.storeProducts[i]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 5,
          mainAxisExtent: 264,
        ),
      ),
    );
  }

/*Widget get typeheadSearch{
    return TypeAheadField(
      textFieldConfiguration: const TextFieldConfiguration(
          autofocus: true,
          style:TextStyle(
              fontStyle: FontStyle.italic
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder()
          )
      ),
      suggestionsCallback: (pattern) async {
        return await BackendService.getSuggestions(pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(suggestion['name']),
          subtitle: Text('\$${suggestion['price']}'),
        );
      },
      onSuggestionSelected: (suggestion) {
        Common.showToast(suggestion);
      },
    );
}*/
  Widget get ProductListServices {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              // const Text("Top Deals ",
              //     style: TextStyle(
              //         fontWeight: FontWeight.w900,
              //         color: MyColors.kColorBlack,
              //         fontSize: 20)),
              const SizedBox(height: 10),
              gridViewOfProducts,
            ],
          ),
        ));
  }

  Widget get gridViewOfProducts {
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: storeDetailController.categories.length,
        itemBuilder: (ctx, i) {
          return  ProductCard(product: storeDetailController.storeProducts[i],);

        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 5,
          mainAxisExtent: 250,
        ),
      ),
    );
  }

  Widget categoryName(String categoryName) {
    return Center(
      child: Text(
        categoryName,textAlign: TextAlign.center,
        style: const TextStyle(
          color: MyColors.kColorBlack,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget topRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              barCode(context),
              const SizedBox(
                height: 10,
              ),
              const Text("Bar Code",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Palette.colorTextBlack))
            ],
          ),
          Column(
            children: [
              kart,
              const SizedBox(
                height: 10,
              ),
              const Text("Kart",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Palette.colorTextBlack))
            ],
          ),
          Column(
            children: [
              pos,
              const SizedBox(
                height: 10,
              ),
              const Text("POS",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Palette.colorTextBlack))
            ],
          ),
        ],
      ),
    );
  }

  Widget barCode(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: MaterialButton(
        shape: const CircleBorder(),
        color: MyColors.appColor,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    QrCodeScanPage(storeId: appPreferences.storeId),
              ));
        },
        child: const Icon(
          Icons.qr_code_scanner,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget get kart {
    return GestureDetector(
      onTap: () {},
      child: MaterialButton(
        shape: const CircleBorder(),
        color: MyColors.appColor,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          Common.showToast("Coming Soon");
        },
        child: const Icon(
          Icons.shopping_cart,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget get pos {
    return GestureDetector(
      onTap: () {},
      child: MaterialButton(
        shape: const CircleBorder(),
        color: MyColors.appColor,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          Common.showToast("Coming Soon");
        },
        child: const Icon(
          Icons.point_of_sale,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
