
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jump_q/theme/my_theme.dart';


class Common {
  static Options getOptions(String authToken) {
    return Options(
        headers: {"Authorization": authToken, "device": "mobile"});
  }

  static Future<bool?> showToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.kColorToast,
        textColor: MyColors.kColorBlack,
        fontSize: 16.0
    );
  }


   static  Future<bool> inInternet() async {
     try {
       final result = await InternetAddress.lookup('google.com');
       return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
     } on SocketException catch (_) {
       return false;
     }



  }
  /*static void showAlert() {
    var alert = AlertDialog(
      content: Row(
        children: const <Widget>[Text("No internet connection!")],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () => Get.back,
            child: const Text(
              "OK",
              style: TextStyle(color: MyColors.appColor),
            ))
      ],
    );

    showDialog(
        context: Get.context!,
        builder: (_) {
          return alert;
        });
  }*/
  }