import 'package:flutter/cupertino.dart';

class ProfileImageNotifier extends ChangeNotifier{
  String profileImage="https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png";
  void onChangeImage(String updatedProfileIMage){
    profileImage=updatedProfileIMage;
    notifyListeners();
  }


}