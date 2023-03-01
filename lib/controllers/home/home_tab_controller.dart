import 'package:jump_q/controllers/base_getx_controller.dart';
import '../../ui/view/home/tab/dashboard/dashboard.dart';

class HomeTabController extends BaseController{
  final currentPage = const Dashboard(isStore: false);
}