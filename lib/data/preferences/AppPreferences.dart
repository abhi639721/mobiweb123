import 'package:shared_preferences/shared_preferences.dart';

import 'app_preference_key.dart';

class AppPreferences {
  final SharedPreferences  sharedPreferences;

  AppPreferences({ required this.sharedPreferences});

  Future<bool> _saveString(String key ,String? value){
    return sharedPreferences.setString(key, value?? "");
  }
  String? _getString(String key, {String defaultValue = ""}){
    return sharedPreferences.getString(key)?? defaultValue;
 }

  Future<bool> _saveBoolean(String key ,bool value){
    return sharedPreferences.setBool(key, value);
  }
  bool getBoolean(String key,{bool defaultValue = false}){
    return sharedPreferences.getBool(key)??false;
  }

int _getInt(String key ,{int defaultValue = 0}){
    final str = _getString(key,defaultValue: defaultValue.toString());
    final value = int.tryParse(str!);
    if(value !=null){
      return value;
    }
    return defaultValue;
}

 Future<void> saveEmail(String email){
    return _saveString(AppPreferenceKey.keyEmail, email);
 }
 String get email {
    return _getString(AppPreferenceKey.keyEmail,defaultValue: "")!;
  }
  Future<void> saveAuthToken(String toke){
    return _saveString(AppPreferenceKey.authToken, toke);
  }
  String get authToken {
    return _getString(AppPreferenceKey.authToken,defaultValue: "")!;
  }

  Future<void> saveUserId(String userId){
    return _saveString(AppPreferenceKey.userId, userId);
  }
  String get userId {
    return _getString(AppPreferenceKey.userId,defaultValue: "")!;
  }



  Future<void> saveFCMToken(String userId){
    return _saveString(AppPreferenceKey.fcmToken, fcmToken);
  }
  String get fcmToken {
    return _getString(AppPreferenceKey.fcmToken,defaultValue: "")!;
  }

  Future<void> saveDeviceId(String userId){
    return _saveString(AppPreferenceKey.deviceId, deviceId);
  }
  String get deviceId {
    return _getString(AppPreferenceKey.deviceId,defaultValue: "")!;
  }

  Future<void> saveUserImage(String userImage){
    return _saveString(AppPreferenceKey.userImage, userImage);


  }
  String get userImage {
    return _getString(AppPreferenceKey.userImage,defaultValue: "")!;
  }

  Future<void> saveUserName(String userName){
    return _saveString(AppPreferenceKey.userName, userName);
  }
  String get userName {
    return _getString(AppPreferenceKey.userName,defaultValue: "")!;
  }
  Future<void> saveLoggedIn(bool loggedIn){
    return _saveBoolean(AppPreferenceKey.loggedIn, loggedIn);
  }
  bool get isLoggedIn{
    return getBoolean(AppPreferenceKey.loggedIn);
  }
  /*bool get userName {
    return _getInt(AppPreferenceKey.loggedIn,defaultValue: false)!;
  }*/
  Future<void> saveStoreId(String userId){
    return _saveString(AppPreferenceKey.storeId, userId);
  }
  String get storeId {
    return _getString(AppPreferenceKey.storeId,defaultValue: "0")!;
  }
  Future<void> saveRestaurantId(String userId){
    return _saveString(AppPreferenceKey.restaurantId, userId);
  }
  String get restaurantId {
    return _getString(AppPreferenceKey.restaurantId,defaultValue: "0")!;
  }
  Future<void> saveRestaurantMenuId(String userId){
    return _saveString(AppPreferenceKey.restaurantMenuId, userId);
  }
  String get restaurantMenuId {
    return _getString(AppPreferenceKey.restaurantMenuId,defaultValue: "0")!;
  }
  Future<void> saveTutorialShow(bool tutorialShow){
    return _saveBoolean(AppPreferenceKey.tutorialShow, tutorialShow);
  }
  bool get isTutorialShow{
    return getBoolean(AppPreferenceKey.tutorialShow);
  }

  Future<void> saveIntroShow(bool introShow){
    return _saveBoolean(AppPreferenceKey.introShow, introShow);
  }
  bool get isIntroShow{
    return getBoolean(AppPreferenceKey.introShow);
  }

 }
