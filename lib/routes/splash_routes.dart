import 'package:get/get.dart';
import 'package:jump_q/splash_screen.dart';

class SplashScreenRoutes{
  SplashScreenRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: SplashScreen.routeName, page: () =>  SplashScreen(),
    )

  ];
}