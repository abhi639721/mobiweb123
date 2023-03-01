import 'package:get/get.dart';
import 'package:jump_q/ui/view/kart/add_delivery_address.dart';
import 'package:jump_q/ui/view/product/order/cash_on%20_counter.dart';

import '../../ui/view/product/order/get_coupons_card.dart';
import '../../ui/view/product/order/payment_complete.dart';
import '../../ui/view/product/order/paymentview.dart';
class OrderRoutes{
  OrderRoutes._();
  static List<GetPage> get routes => [
   // GetPage(name: OrderHistory.routeName, page: () =>  OrderHistory()),
    GetPage(name: PaymentComplete.routeName, page: () =>  PaymentComplete()),
    GetPage(name: PaymentoptionsView.routeName, page: () =>  PaymentoptionsView()),
    GetPage(name: AddDeliveryAddress.routeName, page: () =>  AddDeliveryAddress()),

    GetPage(name: CouponPage.routeName, page: () =>  CouponPage()),
    GetPage(name: CashOnCounter.routeName, page: () =>  CashOnCounter()),





  ];
}