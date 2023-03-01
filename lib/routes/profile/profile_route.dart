import 'package:get/get.dart';
import 'package:jump_q/ui/view/profile/profile.dart';
import '../../ui/view/profile/edit_profile.dart';
class ProfileRoutes{
  ProfileRoutes._();
  static List<GetPage> get routes => [
     GetPage(name: Profile.routeName, page: () =>  Profile()),
    GetPage(name: EditProfile.routeName, page: () =>  EditProfile()),



  ];
}