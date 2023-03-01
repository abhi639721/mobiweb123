import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jump_q/ui/view/home/notification/notification_view.dart';
class NotificationRoutes{
  NotificationRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: NotificationView.routeName, page: () =>  NotificationView()),
  ];
}