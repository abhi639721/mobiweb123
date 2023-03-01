import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/home/home_controller.dart';
import 'package:jump_q/controllers/profile/profile_controller.dart';
import 'package:jump_q/notifire/image_notifire.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/drawar/about_us.dart';
import 'package:jump_q/ui/view/loginandsignup/login_page.dart';
import 'package:jump_q/ui/view/profile/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/preferences/AppPreferences.dart';
import '../../../helper/gradient_outline_button.dart';
import 'my_accounts/accounts.dart';
import 'help.dart';
import 'privacy_policy.dart';
import '../loginandsignup/sign_up.dart';

class DrawerDashboard extends StatefulWidget {
  DrawerDashboard({Key? key}) : super(key: key);

  @override
  _DrawerDashboardState createState() => _DrawerDashboardState();
}

class _DrawerDashboardState extends State<DrawerDashboard> {
  final appPreferences = Get.find<AppPreferences>();

  void refreshPage() {
    setState(() {
      profileController.callUpdateApi();
    });
  }

  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: MyColors.kColorLightBC,
        // column holds all the widgets in the drawer
        child: Column(
          children: <Widget>[
            Expanded(
              // ListView contains a group of widgets that scroll inside the drawer
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        color: MyColors.colorPrimary,
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                userImage(),
                                const SizedBox(
                                  width: 8,
                                ),
                                userName()
                              ],
                            ),
                            //slogin
                            loginAndSignUp
                          ],
                        ),
                      ),
                      Positioned(
                          top: 180,
                          left: 20,
                          child: Container(
                            height: 40,
                            width: 265,
                            decoration: BoxDecoration(
                                color: MyColors.kColorWhite,
                                borderRadius: BorderRadius.circular(4)),
                          )),
                      /* notificationWidget,*/
                      //Divider(height: 19, thickness: 10, color: Colors.blueGrey[900] ),
                    ],
                  ),
                  if (appPreferences.isLoggedIn) profile,
                  account,
                  invite(context),
                  supportAndSecurity,
                  help,
                  security,
                  privacyPolicy,
                  aboutUs,
                  if (appPreferences.isLoggedIn) logOut,
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            branding
          ],
        ),
      ),
    );
  }

  Widget userImage() {
    String userImage =
        Provider.of<ProfileImageNotifier>(context, listen: true).profileImage;
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 14),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(100)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: FadeInImage.assetNetwork(
                  placeholder: "assets/png/app_logo.png", image: userImage)),
        ),
      ),
    );
  }

  Widget userName() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 25),
      child: Align(
        alignment: Alignment.topLeft,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text:
                    "${appPreferences.isLoggedIn ? appPreferences.userName : "Hey User"}\n",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Colors.white)),
            TextSpan(
                text: appPreferences.isLoggedIn ? appPreferences.email : "",
                style: const TextStyle(
                    fontFamily: 'Montserrat', color: Colors.white)),
          ]),
        ),
      ),
    );
  }

  Widget get profile {
    return ListTile(
      leading: const Icon(Icons.person_pin),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(children: [
              const TextSpan(
                  text: "Profile\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87)),
              TextSpan(
                  text: "Name: ${appPreferences.userName}",
                  style: const TextStyle(
                      fontFamily: 'Montserrat', color: Colors.black26)),
            ]),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: size_20,
          ),
        ],
      ),
      onTap: () {
        Get.delete<HomeStoreController>();
        EditProfile.start();
      },
    );
  }

  Widget get account {
    return ListTile(
      leading: const Icon(Icons.account_box),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "Accounts\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87)),
              TextSpan(
                  text: "Accounts",
                  style: TextStyle(
                      fontFamily: 'Montserrat', color: Colors.black26)),
            ]),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: size_20,
          ),
        ],
      ),
      onTap: () {
        Accounts.start();
        // appPreferences.saveLoggedIn(false);
        //navigatorPushReplace(const LoginScreen());
      },
    );
  }

  share(BuildContext context) {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    Share.share(
        "JumpQ- https://play.google.com/store/apps/details?id=com.jumpq.jump_q",
        subject: "Nice",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  Widget invite(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.share),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "Invite",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87)),
              // TextSpan(text: "Name: Email id", style: TextStyle(fontFamily: 'Montserrat', color: Colors.black26)),
            ]),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: size_20,
          ),
        ],
      ),
      onTap: () {
        share(context);
      },
    );
  }

  Widget get supportAndSecurity {
    return const Padding(
      padding: EdgeInsets.only(left: 8),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Support and Security",
            style: TextStyle(color: Colors.black26),
          )),
    );
  }

  Widget get help {
    return ListTile(
      leading: const Icon(Icons.help_outline),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "Help",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87)),
              //TextSpan(text: "Name: Email id", style: TextStyle(fontFamily: 'Montserrat', color: Colors.black26)),
            ]),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: size_20,
          ),
        ],
      ),
      onTap: () {
        Help.start();
        //Session().logout();
        //navigatorPushReplace(const LoginScreen());
      },
    );
  }

  Widget get security {
    return ListTile(
      leading: const Icon(Icons.security),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Security",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.black87)),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: size_20,
          ),
        ],
      ),
      onTap: () {
        //Session().logout();
        //navigatorPushReplace(const LoginScreen());
      },
    );
  }

  Widget get privacyPolicy {
    return ListTile(
      leading: const Icon(Icons.policy),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Privacy Policy",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.black87)),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: size_20,
          ),
        ],
      ),
      onTap: () {
        PrivacyPolicy.start();
        //navigatorPushReplace(const LoginScreen());
      },
    );
  }

  Widget get aboutUs {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "About Us",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87)),
              // TextSpan(text: "Name: Email id", style: TextStyle(fontFamily: 'Montserrat', color: Colors.black26)),
            ]),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: size_20,
          ),
        ],
      ),
      onTap: () {
        AboutUs.start();
        //navigatorPushReplace(const LoginScreen());
      },
    );
  }

  Widget get logOut {
    return ListTile(
      leading: const Icon(Icons.logout),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "LogOut ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87)),
              // TextSpan(text: "Name: Email id", style: TextStyle(fontFamily: 'Montserrat', color: Colors.black26)),
            ]),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: size_20,
          ),
        ],
      ),
      onTap: () {
        final appPreferences = Get.find<AppPreferences>();
        appPreferences.saveLoggedIn(false);
        LogInScreen.start();
        //navigatorPushReplace(const LoginScreen());
      },
    );
  }

  Widget get branding {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Made with"),
            Icon(
              Icons.favorite,
              color: MyColors.kColorRed,
            ),
            const Text(" by "),
            InkWell(
              child: Text("Sukom",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: MyColors.kColorBlue)),
              onTap: () => launch('https://sukomtechnologies.com'),
            ),
          ],
        ),
      ),
    );
  }

  Widget get notificationWidget {
    return Positioned(
      top: 180,
      left: 18,
      child: GradientOutlineButton(
          //backgroundColors:MyColors.kColorWhite,

          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [MyColors.buttonBorderColor, MyColors.buttonBorderColor]),
          radius: size_4,
          child: Row(
            children: [
              Icon(
                Icons.notifications_active_outlined,
                color: MyColors.kColorBlue,
                size: size_30,
              ),
              const SizedBox(
                width: 56,
              ),
              const Text(
                'Notification',
                style: TextStyle(
                    fontSize: 15,
                    color: MyColors.kColorBlack,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 56,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: size_30,
              ),
            ],
          ),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));
          },
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0)),
    );
  }

  Widget get loginAndSignUp {
    return appPreferences.isLoggedIn
        ? const SizedBox.shrink()
        : Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 20),
                child: GradientOutlineButton(
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          MyColors.buttonBorderColor,
                          MyColors.buttonBorderColor
                        ]),
                    radius: size_4,
                    child: const Text(
                      'LogIn',
                      style:
                          TextStyle(fontSize: 15, color: MyColors.kColorWhite),
                    ),
                    onPressed: () {
                      LogInScreen.start();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));
                    },
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 0)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 20),
                child: GradientOutlineButton(
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          MyColors.buttonBorderColor,
                          MyColors.buttonBorderColor
                        ]),
                    radius: size_4,
                    child: const Text(
                      'SignUp',
                      style:
                          TextStyle(fontSize: 15, color: MyColors.kColorWhite),
                    ),
                    onPressed: () {
                      UserSignUp.start();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));
                    },
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 0)),
              ),
            ],
          );
  }
}
