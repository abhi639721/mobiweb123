
import 'package:flutter/material.dart';

import '../theme/my_theme.dart';


class MyButton extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Color? color;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? elevation;
  final double? borderRadius;
  final VoidCallback? onPressed;

   const MyButton({Key? key,
    this.color,
    this.borderRadius,
    this.height,
    this.elevation,
    this.width=double.infinity,
    this.onPressed,
    this.margin,
    this.child,
    this.title,
  }):assert(title!=null || child!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin??EdgeInsets.only(left: size_10,right: size_10),
      child: SizedBox(
        height: height??size_44,
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: size_8,vertical: size_0)),
            elevation: MaterialStateProperty.all(elevation??2),
            backgroundColor: onPressed==null?MaterialStateProperty.all<Color?>(MyColors.kColorBorderGrey):MaterialStateProperty.all<Color?>(color??MyColors.appColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius??size_2)))),
          ),
          child: child??Text("$title",
            textAlign: TextAlign.center,
            style: MyTextStyle.kTextExtraBold.copyWith(color: Colors.white),),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class MyButtonOutline extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Color? color;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback? onPressed;

  const MyButtonOutline({
    this.color,
    this.borderRadius,
    this.height,
    this.width=double.infinity,
    this.onPressed,
    this.margin,
    this.child,
    this.title,
  }):assert(title!=null || child!=null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin??EdgeInsets.only(left: size_12,right: size_12),
      child: SizedBox(
        height: height??size_44,
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(MyColors.kColorWhite),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(color: onPressed==null?Colors.grey:(color??MyColors.appColor)),
                borderRadius: BorderRadius.circular(borderRadius??size_24),
            )),
          ),
          child: child??Text("$title",
            textAlign: TextAlign.center,
            style: MyTextStyle.kTextBold.copyWith(color: onPressed==null?Colors.grey:(color??MyColors.appColor)),),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

Widget MyTextButton({@required title,@required onPress,TextStyle? textStyle,EdgeInsets? padding})
{
  assert(title!=null);
  return  InkWell(
    onTap: onPress,
    child: Container(
        padding:padding??EdgeInsets.all(size_12),
        child: Text(title, style: textStyle??MyTextStyle.kTextSemiBold.copyWith(color: MyColors.appColor,fontSize: size_12))),
  );
}
