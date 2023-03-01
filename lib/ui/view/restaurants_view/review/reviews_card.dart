





import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({
    Key? key,
    required this.image,
    required this.comment,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String image, comment, name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: size_5),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(children: [
          SizedBox(
            height: size_40,
            width: size_40,
            child: CircleAvatar(

              radius: 30,
              backgroundColor: MyColors.appColor.withOpacity(0.3),
              child: Text(
                "A",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: MyColors.kColorWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: size_5),
          SizedBox(
            width: size_200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text(
                  comment,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black45
                ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ]),
        SizedBox(height: size_10),
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              Icon(Icons.star,
                  size: size_10,
                  color: i == 4 ? Colors.black45 : MyColors.appColor),
          ],
        ),
      ]),
    ]);
  }
}
