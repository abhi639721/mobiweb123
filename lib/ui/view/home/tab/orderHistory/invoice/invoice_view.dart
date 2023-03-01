// import 'package:flutter/material.dart';
// import 'package:mobile_app/helper/navigator_help.dart';
// import 'package:mobile_app/theme/my_theme.dart';
// import 'package:pdf/pdf.dart';
//
// class InvoiceViews extends StatelessWidget {
//   const InvoiceViews({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: MyColors.kColorLightBC,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 8),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: MaterialButton(
//                   onPressed: () {
//                     goBack();
//                   },
//                   color: Colors.white,
//                   textColor: Colors.black,
//                   child: Icon(
//                     Icons.arrow_back,
//                     size: 24,
//                   ),
//                   padding: EdgeInsets.all(10),
//                   shape: CircleBorder(),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
//                 child: Card(
//                   color: MyColors.kColorWhite,
//                   child: Container(
//                     margin: const EdgeInsets.all(25),
//                     height: 360,
//                     color: MyColors.kColorWhite,
//                     child: Column(children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/png/app_logo.png',
//                             height: 50,
//                             width: 50,
//                           ),
//                           const SizedBox(width: 1),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'INVOICE',
//                                 style: const TextStyle(
//                                   fontSize: 10.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const Text(
//                                 'Birla Grocery Store',
//                                 style: TextStyle(
//                                   fontSize: 8.0,
//                                   color: MyColors.kColorGrey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Spacer(),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Raaj',
//                                 style: const TextStyle(
//                                   fontSize: 10.5,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const Text(
//                                 'raaj@gmail.com',
//                                 style: TextStyle(
//                                   fontSize: 8.5,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 DateTime.now().toString(),
//                                 style: const TextStyle(
//                                   fontSize: 8.5,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const Align(
//                         alignment: Alignment.centerLeft,
//                         child: const Text(
//                           'ORD1',
//                           style: const TextStyle(
//                             fontSize: 8.0,
//                             color: MyColors.kColorBlack,
//                           ),
//                         ),
//                       ),
//                       //   SizedBox(height: 1 * PdfPageFormat.mm),
//                       const Divider(
//                         color: Colors.black,
//                       ),
//                       const Text(
//                         'Dear Raaj,\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error',
//                         textAlign: TextAlign.justify,
//                         style: const TextStyle(fontSize: 6),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       Container(
//                         color: Colors.grey.shade300,
//                         height: 18,
//                         child: Padding(
//                             padding: const EdgeInsets.all(4),
//                             child: Table(columnWidths: {
//                               0: const FractionColumnWidth(0.3),
//                               1: const FractionColumnWidth(0.2),
//                               2: const FractionColumnWidth(0.2),
//                               3: const FractionColumnWidth(0.2),
//                               4: const FractionColumnWidth(0.2),
//                             }, children: [
//                               const TableRow(children: [
//                                 Text(
//                                   'Product',
//                                   style: TextStyle(
//                                       fontSize: 8, fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   'Quantity',
//                                   style: const TextStyle(
//                                       fontSize: 8, fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   'MRP',
//                                   style: const TextStyle(
//                                       fontSize: 8, fontWeight: FontWeight.bold),
//                                 ),
//                                 const Text(
//                                   'Discount',
//                                   style: const TextStyle(
//                                       fontSize: 8, fontWeight: FontWeight.bold),
//                                 ),
//                                 const Text(
//                                   'Total',
//                                   style: TextStyle(
//                                       fontSize: 8, fontWeight: FontWeight.bold),
//                                 ),
//                               ])
//                             ])),
//                       ),
//                       const SizedBox(
//                         height: 2,
//                       ),
//                       Table(columnWidths: {
//                         0: const FractionColumnWidth(0.3),
//                         1: const FractionColumnWidth(0.2),
//                         2: const FractionColumnWidth(0.2),
//                         3: const FractionColumnWidth(0.2),
//                         4: const FractionColumnWidth(0.2),
//                       }, children: [
//                         const TableRow(children: [
//                           //Text('Classic Mishri ',style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
//                           TableCell(
//                             child: Padding(
//                               padding: EdgeInsets.only(),
//                               child: Text(
//                                 'Classic Mishri ',
//                                 style: TextStyle(
//                                     fontSize: 8, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             '200',
//                             style: TextStyle(
//                                 fontSize: 8, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             '233',
//                             style: const TextStyle(
//                                 fontSize: 8, fontWeight: FontWeight.bold),
//                           ),
//                           const Text(
//                             '150',
//                             style: TextStyle(
//                                 fontSize: 8, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             '300',
//                             style: TextStyle(
//                                 fontSize: 8, fontWeight: FontWeight.bold),
//                           ),
//                         ])
//                       ]),
//                       const Divider(
//                         color: Colors.black,
//                       ),
//
//                       Container(
//                         alignment: Alignment.centerRight,
//                         child: Row(
//                           children: [
//                             const Spacer(flex: 6),
//                             Expanded(
//                               flex: 4,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       const Expanded(
//                                         child: Text(
//                                           'Net total',
//                                           style: TextStyle(
//                                             fontSize: 8,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                       const Text(
//                                         '300',
//                                         style: const TextStyle(
//                                           fontSize: 8,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Expanded(
//                                         child: Text(
//                                           'GST 19.5 %',
//                                           style: TextStyle(
//                                             fontSize: 8,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                       const Text(
//                                         ' 58.5',
//                                         style: const TextStyle(
//                                           fontSize: 8,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const Divider(color: Colors.black),
//                                   Row(
//                                     children: [
//                                       const Expanded(
//                                         child: const Text(
//                                           'Total amount due',
//                                           style: const TextStyle(
//                                             fontSize: 8.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                       const Text(
//                                         '358.5',
//                                         style: const TextStyle(
//                                           fontSize: 8,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 2 * PdfPageFormat.mm),
//                                   Container(
//                                       height: 1, color: MyColors.kColorBlack),
//                                   const SizedBox(height: 0.5 * PdfPageFormat.mm),
//                                   Container(
//                                       height: 1, color: MyColors.kColorBlack),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(mainAxisSize: MainAxisSize.min, children: [
//                         const Divider(color: Colors.black),
//                         const SizedBox(height: 2 * PdfPageFormat.mm),
//                         const Text(
//                           'Birla Grocery Store',
//                           style:
//                               TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
//                         ),
//                         const SizedBox(height: 1 * PdfPageFormat.mm),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               'Address: ',
//                               style: TextStyle(
//                                   fontSize: 8, fontWeight: FontWeight.bold),
//                             ),
//                             const Text(
//                               'Vijay Nagar Ghaziabad up ',
//                               style: TextStyle(
//                                 fontSize: 8,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ])
//                     ]),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
