import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/controllers/home/home_controller.dart';
import 'package:jump_q/controllers/wish/wish_controller.dart';
import 'package:jump_q/ui/shimmer/home_screen_shimmer.dart';
import 'package:jump_q/ui/view/home/tab/dashboard/store_detail_veiw.dart';
import 'package:jump_q/ui/view/home/tab/dashboard/super_market_list_card.dart';
import 'package:jump_q/ui/view/restaurants_view/restaurants_listing.dart';
import '../../../../../data/preferences/AppPreferences.dart';
import '../../../../../theme/my_theme.dart';
import '../../../../../utils/palette.dart';

class Dashboard extends StatefulWidget {
  final bool isStore;

  const Dashboard({Key? key, required this.isStore}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final appPreferences = Get.find<AppPreferences>();
  final homeStoreController = Get.put(HomeStoreController());
  final wishListController = Get.lazyPut(() => WishListController());
  final _scrollController = ScrollController();
  int page = 0;

  @override
  void initState() {
    super.initState();
    homeStoreController.pageNo.value = 0;
    homeStoreController.searchStoreList.value.clear();
    scrollUpdate();
  }

  void scrollUpdate() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Bottom poistion
        if (homeStoreController.pageOffSet.value) {
          homeStoreController.isLoader.value = false;
          homeStoreController.callHomeStoreApi("534", "342",
              page: homeStoreController.pageNo.value);
        }
      }
    }
    );
    if (!widget.isStore && appPreferences.storeId == "0") {
      homeStoreController.callHomeStoreApi("534", "342", page: page);
    }
  }

  @override
  Widget build(BuildContext context) {
    homeStoreController.pageNo.value = 0;
    homeStoreController.searchStoreList.value.clear();
    scrollUpdate();
    return Scaffold(
        body: Obx(() => dd));
        //body: appPreferences.storeId != "0" ? openStore : Obx(() => dd));
  }

  Widget get dd {
    if (homeStoreController.isLoader.value) {
      return const StoreCardShimmer();
    } else {
      return homePage;
    }
  }

  Widget get openStore {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
      child: storeDetailPage,
    );
  }

  Widget get homePage {
    return searchStoreList;
  }

  Widget get storeDetailPage {
    return StoreDetailPage();
  }

  Widget get searchStoreList {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        return scrollUpdate();
      },
      child: tabs(),
    );





  }

  Widget tabs() {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              children: [
                TabBar(
                  labelColor: MyColors.appColor,

                  unselectedLabelColor: MyColors.kColorBlack,
                  // indicator: Decoration(
                  //
                  // ),
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Tab(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                          Icon(
                            Icons.storefront,
                          ),
                          Text(
                            'Shopping Stores',
                          )
                        ])),
                    Tab(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                          Icon(
                            Icons.restaurant_menu_rounded,
                          ),
                          Text(
                            'Restaurants',
                          )
                        ])),
                  ],
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          children: [stores, const RestaurantsListView()],
        ),
      ),
    );
  }

  Widget get stores {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        return scrollUpdate();
      },
      child: Column(
        children: [
          searchBarBox,
          Expanded(
            child: homeStoreController.searchStoreList.isNotEmpty
                ? homeStoreController.searchStoreList.isNotEmpty
                    ? ListView?.builder(
                        padding: EdgeInsets.symmetric(horizontal: size_12),
                        itemCount: homeStoreController.searchStoreList.length,
                        itemBuilder: (context, int index) {
                          return SuperMarketListCard(
                              storeData:
                                  homeStoreController.searchStoreList[index]);
                        })
                    : const SizedBox.shrink()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget get searchBarBox {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: size_16, vertical: size_6),
      padding: EdgeInsets.symmetric(horizontal: size_12, vertical: size_4),
      height: size_44,
      decoration: BoxDecoration(
        color: MyColors.kColorWhite,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.50),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          homeStoreController.onSearch(value);
        },
        decoration: InputDecoration(
          fillColor: MyColors.transparent,
          filled: true,
          hintText: "Search Stores,malls,",
          hintStyle: const TextStyle(
            color: MyColors.kColorBlack500,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Palette.appColor,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
