import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jump_q/ui/view/home/tab/dashboard/store_detail_veiw.dart';
import 'package:jump_q/ui/view/loginandsignup/login_page.dart';
import '../../../../../controllers/home/store_favotire_controller.dart';
import '../../../../../data/preferences/AppPreferences.dart';
import '../../../../../models/dashboard/store_data.dart';
import '../../../../../theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/text_style.dart';

class SuperMarketListCard extends StatefulWidget {
  final StoreData storeData;

  const SuperMarketListCard({Key? key, required this.storeData}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<SuperMarketListCard> {
  final appPreferences = Get.find<AppPreferences>();
  final controller = Get.put(StoreFavoriteController());
  late bool isFavorite ;


  @override
  Widget build(BuildContext context) {
    isFavorite=widget.storeData.favourite;
    return card;
  }

  Widget get card {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
        top: 5,
      ),
      child: Card(
          elevation: 3,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: InkWell(
            onTap: () {
              // appPreferences.saveStoreId(storeData.storeId);
              //Home.start("0");
              appPreferences.saveStoreId(widget.storeData.storeId);
              StoreDetailPage.start(widget.storeData.store_name);
            },
            child: Container(
              decoration: const BoxDecoration(
                  //border: Border.all(color: MyColors.kColorGrey),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/png/app_logo.png',
                        image: widget.storeData.image,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: size_150,
                      ),
                    ),
                    Stack(
                      children: [
                        favorite(),
                        // favoritebuton
                      ],
                    ),
                    // Positioned(
                    //     left: 20,
                    //     bottom: size_5,
                    //     child: Container(
                    //         decoration: BoxDecoration(
                    //           color: Colors.transparent,
                    //           borderRadius: BorderRadius.only(topLeft: Radius.circular(size_15),bottomLeft: Radius.circular(size_15)),
                    //           boxShadow: const [
                    //             BoxShadow(
                    //               color: MyColors.kColorWhite,
                    //               blurRadius: 15.1,
                    //               spreadRadius: 2.1,
                    //               offset: Offset(
                    //                 0.1,
                    //                 0.1,
                    //               ),
                    //             )
                    //           ],
                    //
                    //         ),
                    //         child: RatingStars(rating:widget.storeData.ratings))),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.storeData.store_name,
                          style: TextStyles.headingText(),
                          // const TextStyle(
                          //   fontSize: 14,
                          //   fontWeight: FontWeight.w600,
                          // ),
                        ),
                      ),
                      if (widget.storeData.ratings != 0)
                        Container(
                          height: 20,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: MyColors.appColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.storeData.ratings.toString(),
                                  style: const TextStyle(
                                      color: MyColors.kColorWhite),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(widget.storeData.address,
                          // textAlign: TextAlign.center,
                          style: TextStyles.lowerText()
                          // const TextStyle(
                          //     fontWeight: FontWeight.w100, color: Colors.black87,fontSize: 12),
                          )),
                ),
                storeTime,
                const SizedBox(
                  height: 8,
                )
              ]),
            ),
          )),
    );
  }

  Widget get storeStatus {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: widget.storeData.openStatus == "Opened"
              ? MyColors.kColorGreen
              : MyColors.kColorRed,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.zero,
              bottomLeft: Radius.zero)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.storeData.openStatus,
              style: const TextStyle(color: MyColors.kColorWhite),
            ),
          ],
        ),
      ),
    );
  }

  Widget get storeTime {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.storeData.timings,
                textAlign: TextAlign.center,
                style:  TextStyle(
                     color: MyColors.kColorRed),
              )),
        ),
      ],
    );
  }

  Widget  favorite() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          storeStatus,
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: MyColors.kColorWhite, shape: BoxShape.circle),
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        this.setState(() {
                            widget.storeData.favourite=!isFavorite;
                          });

                       appPreferences.isLoggedIn
                            ? controller.callStoreFavoriteApi(
                                widget.storeData.storeId, isFavorite)
                            : LogInScreen.start();
                      },
                      icon:Icon(isFavorite==true?Icons.favorite : Icons.favorite_border,color: MyColors.appColor,))),
            ),
          ),
        ],
      ),
    );
  }
}
