




import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/widget/restraunt_widget/slidder_column_widget.dart';

class RestrauntReviews extends StatelessWidget {
  const RestrauntReviews({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.appColor.shade100,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: MyColors.kColorBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // SizedBox(
                          //   width: size_20,
                          // ),

                          SizedBox(
                        height: size_100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Overall rating',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: MyColors.kColorBlack,
                                fontSize: size_12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "4.6",
                              style:
                              Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: MyColors.kColorBlack,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < 5; i++)
                                  Icon(Icons.star,
                                      size: size_15,
                                      color: i == 4
                                          ? MyColors.kColorGrey
                                          : MyColors.appColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size_30),
                        child: Container(
                          color: MyColors.kColorGrey,
                          height: size_100,
                          width: size_1,
                        ),
                      ),

                      Container(
                        //color: MyColors.kColorGrey,
                        child: Column(children: const [
                          SliderColumnWidget(
                            num: 90,
                            text: '5',
                          ),
                          SliderColumnWidget(
                            num: 60,
                            text: '4',
                          ),
                          SliderColumnWidget(
                            num: 50,
                            text: '3',
                          ),
                          SliderColumnWidget(
                            num: 30,
                            text: '2',
                          ),
                          SliderColumnWidget(
                            num: 10,
                            text: '1',
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        ...items,
      ],
    );
  }
}
