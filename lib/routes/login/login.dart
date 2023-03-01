import 'package:get/get.dart';
import 'package:jump_q/ui/view/loginandsignup/forgot_password.dart';
import 'package:jump_q/ui/view/loginandsignup/otp.dart';
import 'package:jump_q/ui/view/loginandsignup/register.dart';
import 'package:jump_q/ui/view/loginandsignup/set_password.dart';
import 'package:jump_q/ui/view/loginandsignup/sign_up.dart';
import 'package:jump_q/ui/view/loginandsignup/welcome.dart';
import 'package:jump_q/ui/view/tutorial/tutorial.dart';
import '../../ui/view/loginandsignup/login_page.dart';

class LoginRoutes{
  LoginRoutes._();
  static List<GetPage> get routes => [
    GetPage(name: Welcome.routeName, page: () =>  Welcome()),
   // GetPage(name: Register.routeName, page: () =>  Register()),
    GetPage(name: Otp.routeName, page: () =>  Otp()),
    GetPage(name: SetPassword.routeName, page: () =>  SetPassword()),
    GetPage(name: LogInScreen.routeName, page: () =>  LogInScreen()),
    GetPage(name: UserSignUp.routeName, page: () =>  UserSignUp()),
    GetPage(name: ForgotPassword.routeName, page: () =>  ForgotPassword()),
    GetPage(name: Tutorial.routeName, page: () =>  Tutorial()),
  ];
}