





import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/widget/restraunt_widget/custom_slider.dart';

class SliderColumnWidget extends StatefulWidget {
  final String text;
  final double num;
  const SliderColumnWidget({
    Key? key,
    required this.text,
    required this.num,
  }) : super(key: key);



  @override
  State<SliderColumnWidget> createState() => _SliderColumnWidgetState();
}


class _SliderColumnWidgetState extends State<SliderColumnWidget> {





  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Text(
          widget.text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: size_16,
            color:  MyColors.appColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: size_5,
        ),
        CustomSlider(
          percentage: widget.num,
        ),
      ],
    );
  }
}
