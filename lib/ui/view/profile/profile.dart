
import 'package:flutter/material.dart';
import 'package:jump_q/data/preferences/shared_preferences.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/profile/edit_profile.dart';
import 'package:jump_q/ui/view/profile/widget/BottonWidget.dart';
import 'package:jump_q/ui/view/profile/widget/numbers_widget.dart';
import 'package:jump_q/ui/view/profile/widget/profile_widget.dart';

import '../../../services/navigator.dart';

class Profile extends AppPageWithAppBar{
  static String routeName = "/profile";

  Profile({Key? key}) : super(key: key);
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName,
        currentPageTitle: "Profile",);
  }

  @override
  Widget get body{
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath: "https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png",
          onClicked: () {
           //edit profile
          },
        ),
        const SizedBox(height: 24),
        buildName(),
        const SizedBox(height: 24),
        Center(child: buildUpgradeButton()),
        const SizedBox(height: 24),
        NumbersWidget(),
        const SizedBox(height: 48),
        buildAbout(),
      ],

    );
  }
  Widget buildName() => Column(
    children: [
      const Text(
        "Sonu Saini",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        SharedConfig.userId,
        style: const TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade To PRO',
    onClicked: () {
      EditProfile.start();
    },
  );

  Widget buildAbout() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
         Text(
          'About',
          style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
         SizedBox(height: 16),
        Text(
          "When it comes to personalizing your online store, nothing is more effective than an About Us page. This is a quick summary of your company's history and purpose, and should provide a clear overview of the company's brand story. A great About Us page can help tell your brand story, establish customer loyalty, and turn your bland ecommerce store into an well-loved brand icon. Most importantly",
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );
}