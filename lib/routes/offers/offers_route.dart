
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jump_q/ui/view/wish/wish_list_tab.dart';

import '../../ui/view/wish/product_wish_list.dart';

class OffersRoutes{
  OffersRoutes._();
  static List<GetPage> get routes => [
   GetPage(name: WishListTabs.routeName, page: () =>  WishListTabs()),


  ];
}