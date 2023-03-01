import 'package:jump_q/theme/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

getSpaceView({double? width, double? height, double? radius}) {
  return Container(
    width: width ?? double.maxFinite,
    height: height ?? double.maxFinite,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(radius ?? 0),
    ),
  );
}

getShimmerView(
    {double? width,
    double? height,
    double? radius,
    Widget? child,
    BoxBorder? border,
    BorderRadius? borderRadius}) {
  if (width == null && height == null && radius != null) {
    width = radius * 2;
    height = radius * 2;
  }
  return Shimmer.fromColors(
    direction: ShimmerDirection.ltr,
    baseColor: Colors.grey[400]!,
    highlightColor: Colors.grey[100]!,
    child: child ??
        Container(
          width: (width ?? double.maxFinite),
          height: height ?? double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
              border: border),
        ),
  );
}

Widget getUserErrorImageView(
    {double? size,
    double? iconSize,
    Color? fillColor,
    color,
    borderWidth,
    borderRadius,
    BoxBorder? border}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    width: size ?? size_40,
    height: size ?? size_40,
    decoration: BoxDecoration(
        color: fillColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? size_0),
        border: border ??
            Border.all(
                color: color ?? MyColors.appColor.withOpacity(0.5),
                width: borderWidth ?? size_2)),
    child: Center(
      child: Icon(Icons.perm_identity,
          size: iconSize ?? size_24, color: color ?? MyColors.appColor),
    ),
  );
}

Widget getTextErrorImageView(
    {required String? text,
    TextStyle? textStyle,
    BorderRadiusGeometry? borderRadius,
    Color? background,
    EdgeInsets? padding}) {
  return Container(
    padding: padding ?? EdgeInsets.zero,
    decoration: BoxDecoration(
      color: background ?? MyColors.appColor.shade300,
      borderRadius: borderRadius ?? BorderRadius.circular(size_2),
    ),
    child: Center(
        child: Text(
      "--",
      style: textStyle ?? MyTextStyle.kTextRegular,
    )),
  );
}
