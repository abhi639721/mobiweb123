import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jump_q/ui/view/base/base_satateless_widget.dart';

class SnakBar extends BaseStateLessWidget{
  const SnakBar({Key? key,required String message}) : super(key: key);

  String get message => message;


  @override
  Widget build(BuildContext context) {
   return SnackBar(
       content:  Text(message),
    action: SnackBarAction(
    label: 'OK',
    onPressed: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // Some code to undo the change.
    },
    ),);
  }

}