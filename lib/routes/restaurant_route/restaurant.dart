





import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jump_q/ui/view/restaurants_view/item_detail_view.dart';
import 'package:jump_q/ui/view/restaurants_view/restaurants_listing.dart';


class RestaurantRoutes{
  RestaurantRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: RestaurantsListView.routeName, page: () =>  RestaurantsListView() ,transition: Transition.fadeIn),
    GetPage(name: ItemDetailView.routeName, page: () =>  ItemDetailView()
    ,transition: Transition.downToUp,transitionDuration: Duration(milliseconds: 300),
      popGesture: true
    ),


  ];
}

