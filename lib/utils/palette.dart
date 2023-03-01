import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Palette {
  Palette._();
  static const MaterialColor appColor =  MaterialColor(0xFF000080,
      {
        50 :  Color(0x86000080),
        100 : Color(0x11000080),
        200 : Color(0x22000080),
        300 : Color(0x33000080),
        400 : Color(0x44000080),
        500 : Color(0x55000080),
        600 :Color(0x66000080),
        700 :Color(0x77000080),
        800 : Color(0x88000080),
        900 : Color(0x99000080),
      }
  );
  static const Color colorPrimary = Color(0xff000080);
  static const Color  colorTheme = Color(0xff000080);
  static const Color  colorPrimaryDark = Color(0xffFF7465);
  static const Color  colorTextGrey = Color(0xff7C7C7C);
  static const Color  colorTextBlack= Color(0xff000000);
  static const Color  colorTextBLightBlue= Color(0xff476EE2);
  static const Color coloPageBg = Colors.white;
  static const Color background = Color(0x11c3c3c3);

}