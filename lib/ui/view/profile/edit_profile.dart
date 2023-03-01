import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/profile/profile_controller.dart';
import 'package:jump_q/ui/view/base/page.dart';
import 'package:jump_q/ui/view/dialog/loader.dart';
import 'package:jump_q/ui/view/profile/widget/profile_widget.dart';
import 'package:jump_q/utils/palette.dart';
import '../../../services/navigator.dart';
import '../commonwidget/primary_elevated_button.dart';

class EditProfile extends AppPageWithAppBar{
  static String routeName = "/editProfile";
  final controller = Get.put(ProfileController());

  EditProfile({Key? key}) : super(key: key);

  static Future<bool?> start<bool>() {
    return navigateTo<bool>(routeName,
      currentPageTitle: "Profile",);
  }

  @override
  Widget get body{

    return Obx(() => controller.isLoader.value?const Loader():Container(color: Palette.background,child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      physics: const BouncingScrollPhysics(),
      children: [
        Obx(() => ProfileWidget(
          imagePath: (controller.imageUrl.value.isEmpty)?"https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png":controller.imageUrl.value,
          isEdit: true,
          onClicked: () async {
            controller.getImage();
          },
        )),
        const SizedBox(height: 24),
        textField(const Icon(Icons.supervised_user_circle_sharp),"Name",controller.userNameController,"text"),

        const SizedBox(height: 24),
        textField(const Icon(Icons.email),"Email",controller.emailController,"text"),


        const SizedBox(height: 24),
        textField(const Icon(Icons.phone_android_sharp),"Mobile",controller.mobileController,"number"),

        const SizedBox(height: 24),
        textField(const Icon(Icons.home_sharp),"Address",controller.addressController,"text"),

        const SizedBox(height: 24),
        updateButton,
        const SizedBox(height: 24),

      ],


    ),));
  }
  Widget  textField(Icon icons,String label,TextEditingController controller,String type){
    return Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon:icons ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          fillColor: Colors.white,
        ),
      )
    ],);

  }
  Widget get updateButton {
    return Padding(padding: const EdgeInsets.only(left: 0,right: 0),child: SizedBox(width: screenWidget,height:45,child: PrimaryElevatedBtn("Update",() =>controller.callUpdateApi(),borderRadius:40.0 ),),);

  }
}