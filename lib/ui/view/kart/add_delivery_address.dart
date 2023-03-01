import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jump_q/controllers/kart/KartController.dart';
import 'package:jump_q/helper/custom_raised_button.dart';
import 'package:jump_q/services/navigator.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:jump_q/ui/view/dialog/loader.dart';

class AddDeliveryAddress extends StatefulWidget {
  static String routeName = "/AddDeliveryAddress";

  const AddDeliveryAddress({Key? key}) : super(key: key);
  static Future<bool?> start<bool>() {
    return navigateTo<bool>(
      routeName,
      currentPageTitle: "Delivery Address",
    );
  }

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  double get screenWidget => Get.width;
  double get screenHeight => Get.height;

  final controller = Get.put(KartController());

  final isLoader = false.obs;
  var saveAs = "Home";
  int sunday = 0;
  int saturday = 0;
  var postalPinCode = "";
  var subLocality = "";
  var cityOrDistrict = "";
  var state = "";
  late String _radioValue; //Initial definition of radio button value
  late String choice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundLBlueColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Delivery Address"),
        backgroundColor: MyColors.kColorWhite,
        foregroundColor: MyColors.kColorBlack,
      ),
      body: Stack(
        children: [
          isLoader == true?Loader():SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text(" Name",style: TextStyle(color: MyColors.colorTextBlack,fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: size_5,
                  ),
                  Text(
                    "Contact Details",
                    style: TextStyle(
                        letterSpacing: 0.6,
                        color: MyColors.kColorBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: size_15),
                  ),
                  SizedBox(
                    height: size_8,
                  ),
                  textField("Enter Your Name", "Name*",
                      controller.nameController, "name", screenWidget),
                  SizedBox(
                    height: size_8,
                  ),
                  textField("Enter Your Mobile Number", "Mobile Number*",
                      controller.mobileController, "name", screenWidget),
                  SizedBox(
                    height: size_8,
                  ),

                  Text(
                    "Address",
                    style: TextStyle(
                        letterSpacing: 0.6,
                        color: MyColors.kColorBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: size_15),
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: size_8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textField(
                              "Enter Pin Code",
                              "Pin code*",
                              controller.pinCodController,
                              "name",
                              screenWidget / 2.15),
                          locationBTN,
                        ],
                      ),
                      SizedBox(
                        height: size_8,
                      ),
                      textField(
                          "Flat,House No,Building,Street,Area",
                          "Address(Flat,House No,Building,Street,Area)*",
                          controller.addressController,
                          "name",
                          screenWidget),
                      SizedBox(
                        height: size_8,
                      ),
                      textField("Enter Your Town/Locality", "Town/Locality*",
                          controller.townController, "name", screenWidget),
                      SizedBox(
                        height: size_8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              textField(
                                  " City/District",
                                  "City/District*",
                                  controller.cityController,
                                  "name",
                                  screenWidget / 2.15),
                            ],
                          ),
                          textField(
                              " State",
                              "State*",
                              controller.stateController,
                              "name",
                              screenWidget / 2.15),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size_8,
                  ),
                  Text(
                    "Save As ",
                    style: TextStyle(
                        letterSpacing: 0.6,
                        color: MyColors.kColorBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: size_15),
                  ),
                  SizedBox(
                    height: size_8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [homeBTN, workBTN],
                  ),
                  SizedBox(
                    height: size_8,
                  ),
                  if (saveAs == "Work") holidayOption()
                ],
              ),
            ),
          ),

          footer
        ],
      ),
    );
  }

  Widget get locationBTN {
    return InkWell(
      onTap: () async {
        fillField();
      },
      child: Container(
        width: screenWidget / 2.15,
        height: size_44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 0.8, color: MyColors.appColor),
            color: MyColors.kColorWhite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: MyColors.appColor,
            ),
            Text(
              "Location",
              style: TextStyle(
                  letterSpacing: 0.6,
                  color: MyColors.appColor,
                  fontWeight: FontWeight.w500,
                  fontSize: size_15),
            ),
            SizedBox(
              width: size_1,
            ),
          ],
        ),
      ),
    );
  }

  Widget get homeBTN {
    return InkWell(
      onTap: () {
        setState(() {
          saveAs = "Home";

          saveAsBTN();
        });
      },
      child: Container(
        height: size_40,
        width: screenWidget / 2.20,
        padding: EdgeInsets.all(size_8),
        decoration: BoxDecoration(
            color: MyColors.kColorWhite,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                width: saveAs == "Home" ? 1.5 : 0.5,
                color: saveAs == "Home"
                    ? MyColors.appColor
                    : MyColors.kColorBlack)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Icon(
                Icons.home_outlined,
                color:
                    saveAs == "Home" ? MyColors.appColor : MyColors.kColorBlack,
              ),
            ),
            SizedBox(
              width: size_12,
            ),
            Text(
              "Home",
              style: TextStyle(
                  letterSpacing: 0.6,
                  color: saveAs == 1 ? MyColors.appColor : MyColors.kColorBlack,
                  fontWeight: saveAs == 1 ? FontWeight.w500 : FontWeight.w400,
                  fontSize: size_15),
            ),
          ],
        ),
      ),
    );
  }

  Widget get workBTN {
    return InkWell(
      onTap: () {
        setState(() {
          saveAs = "Work";
          saveAsBTN();
        });
      },
      child: Container(
        height: size_40,
        width: screenWidget / 2.20,
        padding: EdgeInsets.all(size_8),
        decoration: BoxDecoration(
            color: MyColors.kColorWhite,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                width: saveAs == "Work" ? 1.5 : 0.5,
                color: saveAs == "Work"
                    ? MyColors.appColor
                    : MyColors.kColorBlack)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Icon(
                Icons.home_work_outlined,
                color:
                    saveAs == "Work" ? MyColors.appColor : MyColors.kColorBlack,
              ),
            ),
            SizedBox(
              width: size_12,
            ),
            Text(
              "Work",
              style: TextStyle(
                  letterSpacing: 0.6,
                  color: saveAs == 2 ? MyColors.appColor : MyColors.kColorBlack,
                  fontWeight: saveAs == 2 ? FontWeight.w500 : FontWeight.w400,
                  fontSize: size_15),
            ),
          ],
        ),
      ),
    );
  }

  Widget get footer {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screenWidget,
        color: MyColors.kColorWhite,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: MyButton(
              borderRadius: 20,
              onPressed: () {

                var openOnSunday;
                var openOnSaturday;
                if (saveAs == "Home") {
                  setState(() {
                    openOnSunday = "";
                    openOnSaturday = "";
                  });
                } else {
                  setState(() {
                    saturday == 1
                        ? openOnSaturday = "Open"
                        : openOnSaturday = "Close";
                    sunday == 1
                        ? openOnSunday = "Open"
                        : openOnSunday = "Close";
                  });
                }
                controller.callAddDeliveryAddressApi(
                  saveAs: saveAs,
                  openOnSunday: openOnSunday,
                  openOnSaturday: openOnSaturday,
                );
                controller.callKartListApi();
              },
              child: Text(
                "Add Delivery Address",
                style: TextStyle(
                    letterSpacing: 0.6,
                    color: MyColors.kColorWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: size_16),
              ),
            )),
      ),
    );
  }

  Widget holidayOption() {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        //horizontalOffset: 100.0,
        //
        verticalOffset: -30,
        child: FadeInAnimation(
          child: Container(
            color: MyColors.kColorWhite,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      sunday == 0 ? sunday = 1 : sunday = 0;
                      print(sunday);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Icon(
                            sunday == 0
                                ? Icons.check_box_outline_blank
                                : Icons.check_box_outlined,
                            color: MyColors.appColor,
                          ),
                        ),
                        SizedBox(
                          width: size_12,
                        ),
                        Text(
                          "Holiday on Sunday",
                          style: TextStyle(
                              letterSpacing: 0.6,
                              color: MyColors.kColorBlack,
                              fontWeight: FontWeight.w400,
                              fontSize: size_15),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      saturday == 0 ? saturday = 1 : saturday = 0;
                      print(saturday);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Icon(
                            saturday == 0
                                ? Icons.check_box_outline_blank
                                : Icons.check_box_outlined,
                            color: MyColors.appColor,
                          ),
                        ),
                        SizedBox(
                          width: size_12,
                        ),
                        Text(
                          "Holiday on Saturday",
                          style: TextStyle(
                              letterSpacing: 0.6,
                              color: MyColors.kColorBlack,
                              fontWeight: FontWeight.w400,
                              fontSize: size_15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(String hint, String label, TextEditingController controller,
      String type, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size_50,
          width: width,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              //prefixIcon:icons,
              fillColor: MyColors.kColorWhite,
              filled: true,
              labelText: label,
              hintText: hint,
              hintStyle: TextStyle(
                  letterSpacing: 0.5,
                  color: MyColors.kColorHintText,
                  fontWeight: FontWeight.normal,
                  fontSize: size_15),
              labelStyle: TextStyle(
                  letterSpacing: 0.5,
                  color: MyColors.kColorBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: size_15),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.kColorWhite),
                  borderRadius: BorderRadius.all(Radius.zero)),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyColors.kColorBlack, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.zero)),
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            ),
          ),
        )
      ],
    );
  }

  void saveAsBTN() {
    if (saveAs == "Home") {
      saveAs = "Home";
      print(saveAs);
    } else {
      saveAs = "Work";
      print(saveAs);
    }
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print("placemarks $placemarks");
    Placemark place = placemarks[0];
    setState(() {
      //address =
      //'${place.subLocality},'
      postalPinCode = '${place.postalCode}';
      subLocality = "${place.subLocality}";
      state = ' ${place.administrativeArea}';
      cityOrDistrict = '${place.locality}';
    });
  }

  Future<void> getAddress() async {
    isLoader.value = true;
    Position position = await _getGeoLocationPosition();
    //cityOrDistrict = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    await getAddressFromLatLong(position);
    isLoader.value = false;
  }

  Future<void> fillField() async {
    setState(() {
      showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(12),
            height: size_200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: MyColors.backgroundLBlueColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Current Location Details",
                        style: TextStyle(
                            fontSize: size_15,
                            letterSpacing: 0.6,
                            color: MyColors.kColorBlack,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: MyColors.kColorBlack,
                          size: size_30,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: "$subLocality\n",
                      style: TextStyle(
                          fontSize: size_15, color: MyColors.kColorBlack),
                      children: <TextSpan>[
                        TextSpan(
                          text: "$cityOrDistrict $state $postalPinCode",
                          style: TextStyle(
                            color: MyColors.kColorBlack,
                            fontSize: size_15,
                          ),
                        ),
                      ]),
                ),
                Container(
                  //color: MyColors.kColorWhite,
                  child: Text(
                    "You can edit or add details leter",
                    style: TextStyle(color: MyColors.kTextColorBlack),
                  ),
                ),
                ElevatedButton(
                  child: const Text('Fill Location details'),
                  onPressed: () {
                    controller.pinCodController.text = postalPinCode;
                    controller.cityController.text = cityOrDistrict;
                    controller.stateController.text = state;
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
