import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/kart/KartController.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/kart/add_delivery_address.dart';

class DeliveryButton extends StatefulWidget {
  const DeliveryButton({Key? key}) : super(key: key);

  @override
  _DeliveryButtonState createState() => _DeliveryButtonState();
}
btnValue(){
  final vl = selected;
}
int selected = 1;

class _DeliveryButtonState extends State<DeliveryButton> {
  final controller = Get.find<KartController>();
  double get screenWidth => Get.width;
  double get screenHeight => Get.height;



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(0),
      child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              decoration: BoxDecoration(
                color: MyColors.kColorWhite,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(size_15),topRight: Radius.circular(size_15))
              ),
              height: size_36,
              width:  screenWidth/2.1,
              child: Row(

                children: [
                  Radio<int>(
                    activeColor: MyColors.statusBarColor,
                    groupValue: selected,
                    onChanged: (value){
                      setState(() {
                        selected = value!;
                        print("Self Pickup");

                        print(selected);

                      });
                    },
                    value: 1,
                  ),
                  const Text('Self Pickup')
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: MyColors.kColorWhite,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size_15),topLeft: Radius.circular(size_15))
              ),
              height: size_36,
              width:  screenWidth/2.1,
              child: Row(
                children: [
                  Radio<int>(
                    activeColor: MyColors.statusBarColor,
                    groupValue: selected,
                    onChanged: (value){
                      setState(() {
                        selected = value!;
                        print("Delivery");
                        print(selected);

                      });
                    },
                    value: 2,
                  ),
                  const Text('Delivery')
                ],
              ),
            )



          ],),
          SizedBox(
            height: size_8,
          ),
         selected==2? deliveryAddress():const SizedBox()
        ],
      ),
    );
  }


  Widget deliveryAddress(){
    return  AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        //horizontalOffset: 100.0,
        //
        verticalOffset: -20,
        child: FadeInAnimation(
          child:Padding(
            padding: const EdgeInsets.symmetric(vertical :4,horizontal: 8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: MyColors.kColorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(20))

              ),

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Delivery to :",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: size_10,),

                            Text(controller.deliveryAs),
                          ],
                        ),
                        GestureDetector(
                            onTap: (){
                              AddDeliveryAddress.start();
                              print("AddDeliveryAddress");

                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.3),
                                    borderRadius: const BorderRadius.all(Radius.circular(10))
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Edit/change",style: TextStyle(color: MyColors.appColor),),
                                )))
                      ],),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size_5,
                          ),
                           Text(
                            "${controller.name.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: size_8,
                          ),
                           Text(controller.address.toString(),overflow: TextOverflow.ellipsis,maxLines: 2,),
                          SizedBox(
                            height: size_8,
                          ),
                           Text(controller.mobile.toString())
                        ],
                      ),
                    )
                  ],),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
