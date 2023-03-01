part of "my_theme.dart";

class AppTheme {
  AppTheme._();

  static bool isDarkMode = false;
  static  Color backgroundColor = MyColors.backgroundColor;
  //static  Color statusBarColor = MyColors.statusBarColor;
  static  Color colorWhiteBlack = MyColors.kColorWhite;
  static  Color colorLightWhiteAppColor = MyColors.inputFillColor;
  static  Color colorBlackWhite = MyColors.kColorBlack;
  static  Color colorLightWhiteBlack = MyColors.kColorHintText;
  static  Color colorSemiLightWhiteBlack = MyColors.kColorHintLight;
  static  Color colorWhiteGrey = MyColors.kColorWhite;
  static  Color colorWhiteGreyDark = MyColors.kColorWhite;
  static  Color inputFillColor = MyColors.inputFillColor;
  static  Color fillColor = MyColors.fillColor;
  static  Color kColorBorderGrey = MyColors.kColorBorderGrey;
  static  Color cardBackground = const Color(0xff313135);

  static ThemeData themeData(context,{bool isDarkTheme = false }) {

    backgroundColor = isDarkTheme?MyColors.backgroundColor:MyColors.kColorWhite;
    //statusBarColor = isDarkTheme?MyColors.backgroundColor:MyColors.kColorWhite;
    colorWhiteBlack = isDarkTheme?MyColors.kColorWhite:MyColors.kColorBlack;
    colorBlackWhite = isDarkTheme?MyColors.kColorBlack:MyColors.kColorWhite;
    colorWhiteGrey = isDarkTheme?MyColors.kColorWhite:MyColors.kColorGrey;
    colorWhiteGreyDark = isDarkTheme?MyColors.kColorWhite:MyColors.inputFillColor;
    colorLightWhiteAppColor = isDarkTheme?MyColors.inputFillColor:MyColors.appColor.shade500;
    inputFillColor = isDarkTheme?MyColors.inputFillColor:MyColors.kColorHintLight;
    fillColor = isDarkTheme?MyColors.kColorHintLight:MyColors.fillColor;
    kColorBorderGrey = isDarkTheme?MyColors.kColorBorderGrey:MyColors.kColorGrey;
    colorLightWhiteBlack = isDarkTheme?MyColors.kColorHintText:MyColors.inputFillColor;
    colorSemiLightWhiteBlack = isDarkTheme ? MyColors.kColorHintLight : const Color(0xFF2B2A29);
    cardBackground = isDarkTheme?const Color(0xff313135):const Color(0xFFF6F6F6);

    TextTheme textTheme = TextTheme(
      headline1: MyTextStyle.kTextBold.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),
      headline2: MyTextStyle.kTextSemiBold.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),
      headline3:MyTextStyle. kTextSemiBold.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack), /// light text
      headline4: MyTextStyle.kTextSemiBold.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),
      headline5: MyTextStyle.kTextSemiBold.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),
      headline6: MyTextStyle.kTextSemiBold.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),
      subtitle1: MyTextStyle.kTextSemiBold.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),     /// bold text
      subtitle2: MyTextStyle.kTextMedium.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),  /// semi bold
      bodyText1: MyTextStyle.kTextMedium.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),
      bodyText2:MyTextStyle. kTextRegular.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack), /// label
      caption: MyTextStyle.kTextRegular.copyWith(color:isDarkTheme? MyColors.kColorWhite:MyColors.kColorBlack),  /// caption
    );
    return ThemeData(
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor:  MyColors.appColor,
      ),
      // for others(Android, Fuchsia)
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: MyColors.appColor,
          selectionColor: MyColors.appColor,
          selectionHandleColor: MyColors.appColor
      ),
      primarySwatch: MyColors.appColor,
      primaryColor: isDarkTheme ? Colors.black : MyColors.appColor,

      backgroundColor: isDarkTheme ?MyColors.appBackgroundColor:MyColors.kColorWhite,

      indicatorColor: isDarkTheme ? const Color(0xff0E1D36) : const Color(0xFF3F51B5),

      hintColor: isDarkTheme ?  const Color(0xff280C0B) : Colors.black,

      highlightColor: isDarkTheme ? const  Color(0xFFFFFFFF) : const  Color(0x22F16A36),
      hoverColor: isDarkTheme ?  const Color(0xff3A3A3B) :  const Color(0xFF3F51B5),
//      iconTheme: IconTheme(data: IconThemeData(), child: null),
      focusColor: isDarkTheme ?  const Color(0xff0B2512) :  const Color(0x00FFAC30),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ?  const Color(0xFF151515) : const  Color(0x00FFAC30),
      canvasColor: isDarkTheme ?MyColors.backgroundColor:MyColors.kColorWhite,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      iconTheme:  IconThemeData(color: isDarkTheme?MyColors.kColorWhite:MyColors.kColorBlack),
      primaryIconTheme:  IconThemeData(color: isDarkTheme?MyColors.kColorWhite:MyColors.kColorBlack),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ?  const ColorScheme.dark() : const  ColorScheme.light()),
      appBarTheme:  AppBarTheme(
        elevation: 0.0,
        backgroundColor: MyColors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: MyColors.backgroundColor, statusBarIconBrightness: Brightness.light),
      ),
      textTheme: textTheme,
    );

  }

}




