import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jump_q/ui/view/base/base_satateless_widget.dart';
import '../../../../../data/preferences/AppPreferences.dart';
import '../../../../../models/dashboard/store_data.dart';
import '../../../../../theme/my_theme.dart';
import '../../../../../utils/palette.dart';
import '../commonwidget/text_style.dart';
import 'kart_list.dart';

class KartStoreCard extends BaseStateLessWidget {
  final StoreData storeData;
  final appPreferences = Get.find<AppPreferences>();
  KartStoreCard({Key? key, required this.storeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return card;
  }

  Widget get card {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Card(
          elevation: 3,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: InkWell(
            onTap: () {
              appPreferences.saveStoreId(storeData.storeId);
              KartPage.start(storeData.storeId);
            },
            child: Container(
              decoration: const BoxDecoration(
                  //border: Border.all(color: MyColors.kColorGrey),
                  borderRadius:
                      BorderRadius.all(Radius.circular(20))),
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: const Radius.circular(20)),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/png/app_logo.png',
                        image: storeData.image,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: 150.0,
                      ),
                    ),
                    Stack(
                      children: [favorite],
                    ),
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
                          storeData.store_name,
                          style: TextStyles.headingText()
                          // const TextStyle(
                          //   fontSize: 16,
                          //   fontWeight: FontWeight.w500,
                          // ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "3.2",
                                style: TextStyle(color: MyColors.kColorBlack),
                              ),
                              Icon(
                                Icons.star,
                                color: MyColors.kColorBlack,
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
                      child: Text(
                        storeData.address,
                       // textAlign: TextAlign.center,
                        style: TextStyles.lowerText()

                      )
                  ),
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
  Widget get storeTime{
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Daily Open at 8:30 AM",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w100, color: Colors.red),
          )),
    );
  }

  Widget get favorite {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {},
          child: Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                  color: Palette.appColor, shape: BoxShape.circle),
              child: const Icon(
                Icons.favorite,
                color: MyColors.kColorWhite,
                size: 20,
              )),
        ),
      ),
    );
  }
}
