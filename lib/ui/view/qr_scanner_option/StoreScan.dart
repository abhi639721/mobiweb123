import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:jump_q/ui/view/home/home.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../controllers/kart/KartController.dart';
import '../../../services/navigator.dart';
import '../../../theme/my_theme.dart';
class StoreScanPage extends StatefulWidget {
  const StoreScanPage({Key? key}) : super(key: key);
  static String routeName = "/StoreScanPage";

  static Future<bool?> start<bool>() {
    return navigateOffAll<bool>(routeName);
  }

  @override
  State<StoreScanPage> createState() => _StoreScanPageState();
}

class _StoreScanPageState extends State<StoreScanPage> {
 final appPreference = Get.find<AppPreferences>();
 final controller = Get.put(KartController());
  @override
  void reassemble() {
    super.reassemble();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kColorBlack,
      appBar: AppBar(leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => navigateOffAll(Home.routeName),
      ),
          title: const Text("Scan Store"),backgroundColor: Colors.white,foregroundColor: MyColors.colorPrimary),
      body: Stack(
         children: [
           Center(
             child: MobileScanner(
                 allowDuplicates: false,
                 onDetect: (barcode, args) {
                   if (barcode.rawValue == null) {
                     debugPrint('Failed to scan Barcode');
                   } else {
                     final String code = barcode.rawValue!;
                     appPreference.saveStoreId(code);
                     Home.start("1");
                   }
                 }),
           ),
           // Center(child: Container(
           //   margin: EdgeInsets.symmetric(horizontal: size_12),
           //     child: Image.asset('assets/png/scan.png',width: size_500,height: size_500,))),

         ],
      ),
    );

  }


  @override
  void dispose() {
    super.dispose();
  }
}
// Widget get qrScan{
//   return  Text('hjdgfhghda');
//
// }
// void _bottomsheet(BuildContext context){
//   showModalBottomSheet(context:context, builder: (contxt){
//     return Container(
//       color: Color(0xFF737373),
//       child: Container(
//         decoration: BoxDecoration(
//             color:Theme.of(context).canvasColor,
//             borderRadius:BorderRadius.only(
//                 topLeft:Radius.circular(30),
//                 topRight:Radius.circular(30)
//             )
//         ),
//         height: 200,
//         child: Column(children: [
//           ListTile(
//             leading:Icon(Icons.edit),
//             title: Text('Update your name'),
//             onTap: (){Navigator.pop(context);},
//           ),
//           ListTile(
//             leading:Icon(Icons.image),
//             title: Text('Update your pic'),
//           ),
//           ListTile(
//             leading:Icon(Icons.settings),
//             title: Text('Setting'),
//           )
//         ],),
//       ),
//     );
//   });
// }
