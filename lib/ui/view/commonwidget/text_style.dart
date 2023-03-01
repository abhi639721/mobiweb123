import 'package:flutter/material.dart';
import 'package:jump_q/utils/palette.dart';

class TextStyles{
  TextStyles._();
  static TextStyle headingText({

    Color color = Palette.colorTheme,
    FontWeight fontWeight =FontWeight.bold,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    double?height,
}){
    return TextStyle(
        fontSize: 15,
    color: color,
      fontWeight: fontWeight,
      fontStyle:  fontStyle,
      decoration: decoration,
      height: height==null?null:height/15
    );
  }
  static TextStyle headingText2({

    Color color = Palette.colorTheme,
    FontWeight fontWeight =FontWeight.bold,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    double?height,
  }){
    return TextStyle(
        fontSize: 25,
        color: color,
        fontWeight: fontWeight,
        fontStyle:  fontStyle,
        decoration: decoration,
        height: height==null?null:height/25
    );
  }
  static TextStyle mediumText({
    Color color = Palette.colorTheme,
    FontWeight fontWeight =FontWeight.bold,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    double?height,
  }){
    return TextStyle(
        fontSize: 12,
        color: color,
        fontWeight: fontWeight,
        fontStyle:  fontStyle,
        decoration: decoration,
        height: height==null?null:height/25
    );
  }
  static TextStyle lowerText({
    Color color = Palette.colorTextBlack,
    FontWeight fontWeight =FontWeight.bold,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    double?height,
  }){
    return  TextStyle(fontSize: 13,
        fontFamily: 'CircularStd',
        color: color,
        // fontWeight: fontWeight,
        fontStyle:  fontStyle,
        decoration: decoration,
        height: height==null?null:height/15
    );
  }

}
