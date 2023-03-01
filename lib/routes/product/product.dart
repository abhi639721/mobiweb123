import 'package:get/get.dart';

import 'package:jump_q/ui/view/product/product_detail.dart';
import 'package:jump_q/ui/view/product/product_list_view.dart';

class ProductRoutes{
  ProductRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: ProductDetail.routeName,
        page: () =>  ProductDetail(),
      transitionDuration: Duration(milliseconds: 300),
      transition: Transition.downToUp
    ),
   // GetPage(name: ProductList.routeName, page: () =>  ProductList()),
    GetPage(name: ProductListView.routeName, page: () =>  ProductListView()),

  ];
}