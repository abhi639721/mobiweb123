

import 'package:jump_q/routes/drawar/drawar_route.dart';
import 'package:jump_q/routes/history/history_route.dart';
import 'package:jump_q/routes/home/home.dart';
import 'package:jump_q/routes/kart/kart_route.dart';
import 'package:jump_q/routes/login/login.dart';
import 'package:jump_q/routes/notification/notification_route.dart';
import 'package:jump_q/routes/offers/offers_route.dart';
import 'package:jump_q/routes/order/order_route.dart';
import 'package:jump_q/routes/product/product.dart';
import 'package:jump_q/routes/profile/profile_route.dart';
import 'package:jump_q/routes/splash_routes.dart';
import 'package:get/get.dart';

import 'routes/restaurant_route/restaurant.dart';

class Routes{
  Routes._();
  static List<GetPage> get(){
    final moduleRoutes = <GetPage>[];
    moduleRoutes.addAll(SplashScreenRoutes.routes);
    moduleRoutes.addAll(LoginRoutes.routes);
    moduleRoutes.addAll(HomeRoutes.routes);
    moduleRoutes.addAll(ProductRoutes.routes);
    moduleRoutes.addAll(KartRoutes.routes);
    moduleRoutes.addAll(OrderRoutes.routes);
    moduleRoutes.addAll(ProfileRoutes.routes);
    moduleRoutes.addAll(DrawarRoutes.routes);
    moduleRoutes.addAll(HistoryRoutes.routes);
    moduleRoutes.addAll(OffersRoutes.routes);
    moduleRoutes.addAll(NotificationRoutes.routes);
    moduleRoutes.addAll(RestaurantRoutes.routes);


    return moduleRoutes;

  }
}

