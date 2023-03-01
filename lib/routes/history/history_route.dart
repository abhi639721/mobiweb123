import 'package:get/get.dart';
import '../../ui/view/home/tab/orderHistory/order_Summary.dart';

class HistoryRoutes{
  HistoryRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: OrderSummary.routeName, page: () =>  OrderSummary()),


  ];
}