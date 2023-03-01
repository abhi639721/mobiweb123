import 'package:flutter/cupertino.dart';
import '../base/base_satateless_widget.dart';

class ImageView extends BaseStateLessWidget{
  final String imgPath;
   ImageView(this.imgPath);
  @override
  Widget build(BuildContext context) {
    return  Center(child:  Image.asset(imgPath),);
  }
  
}
