import 'package:get/get.dart';
import '../../ui/view/kart/kart_list.dart';
import '../../ui/view/kart/kart_store_list.dart';
import 'package:jump_q/ui/view/commonwidget/not_found/cart_not_found.dart';

class KartRoutes{
  KartRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: KartPage.routeName, page: () =>  KartPage()),
    GetPage(name: KartStorePage.routeName, page: () =>  KartStorePage()),
    GetPage(name: CartNotFound.routeName, page: () =>  CartNotFound()),

  ];
}