import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/commonwidget/primary_elevated_button.dart';
import 'package:jump_q/ui/view/home/home.dart';
import '../../base/base_satateless_widget.dart';
import '../../../../../services/navigator.dart';

class ProductNotFound extends BaseStateLessWidget {
  static String routeName = "/dataNotFound";

  ProductNotFound({Key? key}) : super(key: key);
  static Future<bool?> start<bool>() {
    return navigateOffAll<bool>(
      routeName,
      currentPageTitle: "DataNotFound",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // https://multivendor.amrkart.com/public/not-found.jpg
          Padding(padding: const EdgeInsets.only(right: 30), child: image),
          const SizedBox(
            height: 20,
          ),
          text,
          const SizedBox(
            height: 20,
          ),
          button
        ],
      ),
    );
  }

  Widget get image {
    return Image.network(
        'https://cdn-icons-png.flaticon.com/512/4379/4379680.png',
        height: 150,
        width: 150);
  }

  Widget get text {
    return const Text(
      "Wishlist is Empty",
      style: TextStyle(
          color: MyColors.appColor, fontWeight: FontWeight.bold, fontSize: 14),
    );
  }

  Widget get button {
    return PrimaryElevatedBtn(
        "Back to Home", () => navigateOffAll(Home.routeName));
  }
}
