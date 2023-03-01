import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:jump_q/data/network/apiservices/profile_api_services.dart';

import 'package:jump_q/ui/view/commonwidget/snak_bar.dart';
import 'package:jump_q/utils/common_util.dart';
import 'package:provider/provider.dart';
import '../../data/preferences/AppPreferences.dart';
import '../../models/product/ProductData.dart';
import '../../models/profile/ProfileData.dart';
import '../../notifire/image_notifire.dart';
import '../../utils/permission_file.dart';
import '../base_getx_controller.dart';

class ProfileController extends BaseController{
  final apiServices = Get.put(ProfileApiServices());
  final appPreferences = Get.find<AppPreferences>();
  List<ProductData> productDataList = [];
  late ProfileData? profileData;
  final userNameController=TextEditingController();
  final emailController=TextEditingController();
  final mobileController=TextEditingController();
  final addressController=TextEditingController();
  final profilePicUrl = "".obs;
  final imageUrl="".obs;
  late Uint8List _bytesImage;
  final isLoader = true.obs;

  ProfileController();
  @override
  void onInit() {
    callGetProfileApi();
    update();
    super.onInit();
  }


  void callGetProfileApi()async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value=true;
    final response = await apiServices.getProfileApi(appPreferences.authToken);
    isLoader.value=false;
    if(response == null) const SnakBar(message: "Server error");
    if(response!=null && response.status){
      if(response.profileData!=null && response.profileData!.isNotEmpty){
        profileData=response.profileData![0];
        if(profileData!=null){
          userNameController.text=profileData!.username;
          emailController.text=profileData!.email;
          mobileController.text=profileData!.mobile;
          addressController.text=profileData!.address;
          imageUrl.value=profileData!.profilePic;
          appPreferences.saveUserImage(profileData!.profilePic);
          Provider.of<ProfileImageNotifier>(Get.context!,listen: true).onChangeImage(profileData!.profilePic); }
      }

    }else{
     // LogInScreen.start();
      Common.showToast(response?.message??"Server error");
    }

  }
  void callUpdateApi()async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value=true;
    final response = await apiServices.updateProfileApi(appPreferences.authToken,name: userNameController.text,mobile: mobileController.text,email: emailController.text,address: addressController.text);
    isLoader.value=false;
    if(response == null) const SnakBar(message: "Server error");
    if(response!=null && response.status){
      Provider.of<ProfileImageNotifier>(Get.context!,listen: false).onChangeImage(profileData!.profilePic);
      Common.showToast(response.message);
      Get.back();
      update();
    }else{

      Common.showToast(response!.message);


    }

  }
  void callUserPickApi()async {
    bool connectionResult = await Common.inInternet();
    if(!connectionResult){
      Common.showToast("No Internet Connection!");
      return;
    }
    isLoader.value=true;
    final response = await apiServices.updateProfilePickApi(appPreferences.authToken,profilePicUrl.value);
    isLoader.value=false;
    if(response == null)  Common.showToast("Server error");
    if(response!=null && response.status){
      imageUrl.value=response.profilePic;
      Provider.of<ProfileImageNotifier>(Get.context!,listen: false).onChangeImage(response.profilePic);
      Common.showToast(response.message);
    }else{
     Common.showToast(response!.message);

    }

  }
  void getImage() async {

    var statusStorage = await Permission.storage.status;
    if (statusStorage.isGranted) {
      try {
        final image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {update();
          profilePicUrl.value  = (await readToBytes(image.path.toString()))! ;
          _bytesImage = const Base64Decoder().convert(profilePicUrl.value);

          callUserPickApi();
        }
      } on PlatformException catch (e) {
        Common.showToast('Failed to pick image: $e');
      }
    } else {
      if (await requestPermission(Permission.storage, 'Storage') == false)
        return;
      try {
        final image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          profilePicUrl.value = await readToBytes(image.path.toString()) as String;
          _bytesImage = const Base64Decoder().convert(profilePicUrl.value);
          callUserPickApi();
        }
      } on PlatformException catch (e) {
        Common.showToast('Failed to pick image: $e');
      }
    }
  }

  Future<String?> readToBytes(String path) async {
    try {
      var file = File.fromUri(Uri.parse(path));
      List<int> bytes = file.readAsBytesSync();
      return base64Encode(bytes);
    } catch (e) {
      print(e);
      return null;
    }
  }


}