
part of "my_theme.dart";

class MyColors{
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
  static const Color  colorPrimaryDark = Color(0xff000080);
  static const Color  colorTextGrey = Color(0xff7C7C7C);
  static const Color  colorTextBlack= Color(0xff000000);
  static const Color coloPageBg = Colors.white;
  static  Color buttonColor = appColor;
  static Color? statusBarColor = appColor;
  static Color transparent = Color(0x00FFFFFF);
  static const Color backgroundLBlueColor =  Color(0xfff3f6ff);
  static Color restrauntBgColor = Color.fromARGB(255, 237, 237, 237);
  static Color backgroundColor = Color(0xF7216274);
  static Color backgroundColor2 = Color(0xF73195AF);
  static Color buttonsColor = Color(0xF7CC7F00);
  static Color drawerColor = Color(0xF7895501);
  static const Color buttonBorderColor = Color(0xF7FFC971);
  static Color buttonsColor2 = Color(0xF721ACBF);
  static Color buttonlightColor = Color(0xF768A8B9);
  static Color fillColor = Color(0xFFF6F6FE);

  static Color fillDarkColor = Color(0xFFF5F1FD);
  static Color kColorGreen = Colors.green;
  static Color kColorGreenDark = Color(0xFF008E06);
  static Color kColorBlue = Colors.blue.shade200;

  static const Color secondaryAppColor = Color(0xFF216274);
  static const Color skyColor = Color(0xFF00CFFF);
  static const Color disableColor = Color.fromRGBO(237, 237, 237, 1.0);
  static const Color kColorBGGrey = Color(0xFFF9F9F9);
  static const Color kColorWhite = Color(0xFFFFFFFF);
  static const Color kColorLightWhite = Color(0xFFF2F2F1);
  static const Color kColorLightBlueWhite = Color(0xFFFF5F6FA);
  static const Color ColorBackgraundWhite = Color(0xFFF8FCFD);
  static const Color kColorGold = Color(0xFFA97625);
  static  Color kColorExtraLightGrey = Color(0xFFC4C4DB);
  static  Color kColorGreyLight = const Color(0x38F6F6F6);
  static  Color kColorGreyAlpha = const Color(0x9F313135);
  static  Color kColorHintText = const Color(0xFFAFAFAF);
  static  Color kColorHintLight = const Color(0xFFF6F6F6);
  // static  Color buttonColor = appColor;
  // static const Color kColorLightWhite = Color(0xFFF2F2F1);
  // static const Color kColorLightBlueWhite = Color(0xFFFF5F6FA);
  static const Color kColorLightBC = Color(0xFFFF5F7FB);
 // static Color transparent = const Color(0x00FFFFFF);
  static Color kColorDarkBlack = const Color(0xFF000000);
  //static Color backgroundColor = const Color(0xFF2B2A29);
  static Color appBackgroundColor =const Color(0xFF202020);
  //static Color statusBarColor = backgroundColor;
 // static Color fillColor = const Color(0xff313135);
  static Color inputFillColor = const Color(0xFF55565A);


  //static const kPrimaryColor = Color(0xFF6F35A5);
  static const kPrimaryLightColor = Color(0xFFF1E6FF);

  // static const Color kColorExtraLightGrey = Color(0x14002126);
  static const Color kTextColorBlack = Color(0x99002126);
  static const Color kTextColorBlue = Color(0xFF141F47);
  static Color kColorSemiBlack = Color(0x88000000);
  static  Color kColorLightBlack = Color(0x76000000);
  static  Color kColorSemiLightBlack = Color(0x66000000);
  static  Color kColorExtraLightBlack = Color(0x30000000);
  static  Color kColorGrey = Colors.grey;
  static  const Color kColorDarkGrey =  Color(0xFF282828);
  static  Color kColorLightGrey = Color(0xF1282828);
  static  Color kColorLightGreyAlpha = Color(0x99AAAAAA);
  static  Color kColorToast = Color(0xFFB5B5FF);

  static  Color kColorBorderGrey = Color(0xFFACA7A6);
 // static  Color kColorPurple = Color(0xFF85BD00);
  static  Color kColorLightGreen = Color(0xFFA0F9A0);
  static  Color kColorLightBGPurple = Color(0xFFF4F3FF);
  static  Color kColorLightBGGreen = Color(0xFFE7FCE8);
  static  Color kColorLightBGreen = Color(0xFFDEEED8);

  static  Color kColorOrange = Color(0xFFFFBE00);
  static  Color kColorBorder = Color(0x33000000);
  static  Color kColorRed = Color(0xFFFD0303);
  static  Color kColorLightRed = Color(0xFFFAD9D9);
 // static  Color kColorLightBGRed = Color(0xFAD9D9FF);
  static  Color lineColor = Color.fromRGBO(241,241,241,1);

  static const Color kColorBlack = Colors.black;
  static const Color kColorBlack50 = Color(0x05000000);
  static const Color kColorBlack100 = Color(0x10000000);
  static const Color kColorBlack200 = Color(0x22000000);
  static const Color kColorBlack300 = Color(0x38000000);
  static const Color kColorBlack400 = Color(0x40000000);
  static const Color kColorBlack500 = Color(0x55000000);
  static const Color kColorBlack600 = Color(0x66000000);
  static const Color kColorBlack700 = Color(0x70000000);
  static const Color kColorBlack800 = Color(0x88000000);
  static const Color kColorBlack900 = Color(0x99000000);
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }


}