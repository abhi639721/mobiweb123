
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';



BoxDecoration getInputBorder() {
  return BoxDecoration(
      color: MyColors.kColorWhite,
      borderRadius: BorderRadius.circular(size_5),
      border: Border.all(color: MyColors.kColorWhite));
}

Widget getInputBoxContainer(Widget child, {BoxDecoration? boxDecoration}) {
  return Container(
    margin: EdgeInsets.only(top: size_6),
    padding: EdgeInsets.only(left: size_12, right: size_12),
    decoration: boxDecoration ?? getInputBorder(),
    child: child,
  );
}

getInputView(
    {required String title,
    required Widget child,
    Color titleTextColor = MyColors.appColor,
    double marginTop = 0,
    double marginLeft = 0,
    Axis axis = Axis.vertical,
    BoxDecoration? boxDecoration,
    bool withContainer = true}) {
  return axis == Axis.vertical
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: marginTop,
            ),
            if (title.isNotEmpty)
              Text(
                title,
                style: MyTextStyle.kTextMedium.copyWith(color: titleTextColor),
              ),
            if (!withContainer)
              SizedBox(
                height: size_6,
              ),
            withContainer
                ? getInputBoxContainer(child, boxDecoration: boxDecoration)
                : child,
          ],
        )
      : Row(
          children: [
            Expanded(
              child: withContainer
                  ? getInputBoxContainer(child, boxDecoration: boxDecoration)
                  : child,
            ),
            SizedBox(
              width: marginLeft,
            ),
            Text(
              title,
              style:
                  MyTextStyle.kTextMedium.copyWith(color: MyColors.kTextColorBlack),
            ),
          ],
        );
}

/// Decoration for all input
InputDecoration greyInputDecoration(
    {String? hintText,
      TextStyle? hintStyle,
      Color? borderColor,
      Color? allBorderColor,
      EdgeInsets? contentPadding,
      Color? fillColor,
      BorderRadius? borderRadius,
      InputBorder? border,
      bool withBorder = true,
      bool withFocusBorder = true}) {
  // String? labelText;
  return InputDecoration(
      border: (border ??
          OutlineInputBorder(
            borderSide: !withBorder ? BorderSide.none : BorderSide(
                color: allBorderColor ?? (borderColor ?? MyColors.kColorWhite),
                width: 2),
            borderRadius: borderRadius ?? BorderRadius.circular(size_3),
          )),
      enabledBorder: !withBorder ? null : OutlineInputBorder(

        borderSide: BorderSide(
            color: allBorderColor ?? (borderColor ?? MyColors.kColorWhite)),
        borderRadius: borderRadius ?? BorderRadius.circular(size_3),
      ),
      disabledBorder: !withBorder ? null : OutlineInputBorder(
        borderSide: BorderSide(
            color: allBorderColor ?? (borderColor ?? MyColors.kColorBorder)),
        borderRadius: borderRadius ?? BorderRadius.circular(size_10),
      ),
      focusedBorder: !withBorder || !withFocusBorder
          ? null
          : OutlineInputBorder(
        borderSide: BorderSide(

            color: allBorderColor ?? MyColors.kColorWhite, width: 2),
        borderRadius: borderRadius ?? BorderRadius.circular(size_3),
      ),

      filled: true,
      fillColor: fillColor ?? MyColors.kColorWhite,
      contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(15, 3, 15, 3),
      hintText: hintText ?? '',
      // labelText:  labelText ??"",Center
      labelStyle: MyTextStyle.kTextHint,
      helperStyle: MyTextStyle.kTextHint,
      hintStyle: hintStyle ?? MyTextStyle.kTextHint);
}
