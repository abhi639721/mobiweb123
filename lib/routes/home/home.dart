import 'package:get/get.dart';
import 'package:jump_q/ui/view/home/home.dart';
import 'package:jump_q/ui/view/maintenance_mode_view.dart';
import 'package:jump_q/ui/view/qr_scanner_option/StoreScan.dart';

import '../../ui/view/home/tab/dashboard/store_detail_veiw.dart';


class HomeRoutes{
  HomeRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: MaintenanceModeView.routeName, page: () =>  MaintenanceModeView()),
    GetPage(name: Home.routeName, page: () =>  Home()),
    GetPage(name: StoreScanPage.routeName, page: () =>  StoreScanPage()),
    GetPage(name: StoreDetailPage.routeName, page: () =>  StoreDetailPage()),



  ];
}