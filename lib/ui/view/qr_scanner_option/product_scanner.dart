import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jump_q/models/product/ProductData.dart';
import 'package:jump_q/theme/my_theme.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../controllers/kart/KartController.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../data/preferences/AppPreferences.dart';

class QrCodeScanPage extends StatefulWidget {
  QrCodeScanPage({Key? key, required this.storeId}) : super(key: key);
  final String storeId;
  @override
  State<QrCodeScanPage> createState() => _QrCodeScanPageState();
}

class _QrCodeScanPageState extends State<QrCodeScanPage> {
  final kartController = Get.put(KartController());
  final appPreference = Get.find<AppPreferences>();
  final productDetailController = Get.put(ProductController());
  MobileScannerController mobileScannerController = MobileScannerController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    appPreference.saveStoreId(widget.storeId);
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text("Scan Product"),
            backgroundColor: Colors.white,
            foregroundColor: MyColors.colorPrimary),
        body: Stack(
          children: [
            MobileScanner(
                //controller: MobileScannerController(),
                allowDuplicates: false,
                onDetect: (barcode, args) {
                  if (barcode.rawValue == null) {
                    debugPrint('Failed to scan Barcode');
                  } else {
                    final String code = barcode.rawValue!;
                    ProductData? data = getData(code, context) as ProductData?;
                    if (data != null) {}
                  }
                }),
            // Image.asset(
            //   'assets/png/scan.png',
            //   width: 200,
            //   height: 200,
            // ),
          ],
        ));
  }

  Future<ProductData?> getData(String barcode, BuildContext context) async {
    return await productDetailController.callProductDetailApi(
        barcode: barcode,
        storeId: widget.storeId,
        context: context,
        kartController: kartController);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
