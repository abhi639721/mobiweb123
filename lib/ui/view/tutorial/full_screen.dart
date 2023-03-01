import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jump_q/ui/view/commonwidget/image_view.dart';

class FullScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var getScreenHeight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Scaffold(
        body: Center(
          child: CarouselSlider(
              options: CarouselOptions(height: getScreenHeight,autoPlay: true,viewportFraction: 1.0),
              items: [
                ImageView("assets/images/image_1.png"),
                ImageView("assets/images/image_2.png"),
                ImageView("assets/images/image_3.png"),
                ImageView("assets/images/image_4.png"),
                ImageView("assets/images/image_5.png"),

              ]
          ),
        )
    );
  }

}