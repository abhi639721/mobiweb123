


import 'dart:convert';

import 'package:jump_q/data/preferences/app_preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/Constant.dart';



SharedPreferences? prefs;



class Session{
  static Session? _instance;
  factory Session() => _instance ??= Session._();
  Session._(){
    // SharedPreferences.setMockInitialValues();
  }

  init(SharedPreferences? preferences) async
  {
    if(prefs==null) {
      prefs=await SharedPreferences.getInstance();
    } else {
      prefs=preferences;
    }
  }

  getBoolean(String key,{bool defaultValue=false})
  {
    return prefs!.getBool(key)??defaultValue;
  }

  bool? isLogin()
  {
    if(prefs!.getBool(Constant.LOGIN_STATUS)!=null) {
      return prefs!.getBool(Constant.LOGIN_STATUS);
    }
    return false;
  }

  String getString(String key,{String defaultValue=""})
  {
    return prefs?.getString(key)??defaultValue;
  }

  String get getFullName => getString(Constant.USER_FULL_NAME);
  String get authToken => getString(AppPreferenceKey.authToken);
  String get getUserImage => getString(Constant.USER_PROFILE,defaultValue: "")!=""? getString(Constant.USER_PROFILE,defaultValue: "") : "";


  getInt(String key,{int defaultValue=0})
  {
    return prefs?.getInt(key)??defaultValue;
  }



  // isTokenExpire({getDecodedData = false}){
  //   String token=getString(Constant.AUTH_TOKEN);
  //   if(token == null || token == "")
  //     return false;
  //   Map<String, dynamic> decodedToken = JwtDecoder.decode(getString(Constant.AUTH_TOKEN));
  //   log("the token data${decodedToken}");
  //
  //
  //   bool hasExpired = JwtDecoder.isExpired(getString(Constant.AUTH_TOKEN));
  //   DateTime expirationDate = JwtDecoder.getExpirationDate(token);
  //   if(getDecodedData)
  //     return decodedToken;
  //   return !expirationDate.isAfter(DateTime.now().add(Duration(minutes: 30)));
  // }

  setAppMetricaUser()
  {
    // if(isLogin()!) {
    //   var userData=json.decode(getString(Constant.USER_PROFILE_ALL_DATA));
    //
    //   SentryUser userInfo = new SentryUser(id: "${userData["username"]}",
    //       email: userData["email"] ?? "Unknown",
    //       username: "${getString(Constant.USER_FULL_NAME)}");
    //
    //   SentryReporter.setUser(userInfo) ;
    //
    //   // AppmetricaSdk().reportUserProfileUserName(
    //   //   userName: "${getString(Constant.USER_EMAIL)}",);
    //   //
    //   // AppmetricaSdk().reportUserProfileCustomString(
    //   //     key: "User",
    //   //     value: "${getString(Constant.USER_FULL_NAME)}");
    //   //
    //   // AppmetricaSdk().reportUserProfileCustomString(
    //   //     key: "Email",
    //   //     value: "${userData["primaryEmail"]}");
    //
    //   String phone="";
    //   if(userData["mobile"]?.toString().isNotEmpty??false)
    //     phone=userData["mobile"];
    //   else
    //     phone=userData["phone"];
    //
    //   // AppmetricaSdk().reportUserProfileCustomString(
    //   //     key: "Phone",
    //   //     value: "$phone");
    // }
    // else {
    //   // AppmetricaSdk().reportUserProfileUserName(userName: null);
    //   SentryReporter.setUser(null);
    // }
  }

  getUserData(){
    var userData=json.decode(getString(Constant.USER_PROFILE_ALL_DATA));
    return userData;
  }




}