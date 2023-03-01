import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jump_q/data/preferences/AppPreferences.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../../../../controllers/order/order_history_controller.dart';
import 'invoice_services.dart';

class PdfInvoiceData {
  final orderHistoryController = Get.put(OrderHistoryController());
  final appPreferences = Get.find<AppPreferences>();
 // late OrderHistoryDetailModel orderHistoryDetailModel;
  static Future<File> generate(String userName, String userEmail) async {
    final orderHistoryController = Get.put(OrderHistoryController());
    // late OrderHistoryDetailModel orderHistoryDetailModel;
    final pdf = pw.Document();
    // final items = pw.itemName(orderHistoryController);
    // final iconImage =
    //     (await rootBundle.load('assets/png/app_logo.png')).buffer.asUint8List();
    // pw.ListView.builder(itemBuilder: , itemCount: orderHistoryController.orderList.length)

    final tableHeaders = [
      'Product',
      'Quantity',
      'MRP',
      'Total',
    ];
    final tableGSTHeaders = ['Taxble', 'CGST', 'SGST', "TOTAL"];
    final tableGSTData = [
      ['170', '5.0', '5.0', "180"],
    ];
    final tableData =
        //orderHistoryController.orderHistoryDetailModel.orderHistoryData
        tableDataList(orderHistoryController);
    /*[
        '${orderHistoryController.orderHistoryDetailModel.orderHistoryData}',
        '${orderHistoryController.orderHistoryDetailModel.totalItems}',
        '${orderHistoryController.orderHistoryDetailModel.grandTotal}',
        '${orderHistoryController.orderHistoryDetailModel.discount}',
        '${orderHistoryController.orderHistoryDetailModel.paidAmount}',
      ],*/

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll57,
        build: (context) {
          //orderHistoryController.callOrderHistoryDetailApi(arguments["oderId"]) ;
          final orderHistoryController = Get.put(OrderHistoryController());
          return pw.Column(children: [
            pw.Text(
              "SHOP # ${orderHistoryController.orderHistoryDetailModel.storeName}",
              style: const pw.TextStyle(
                fontSize: 5.0,
                color: PdfColors.black,
              ),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              orderHistoryController.orderHistoryDetailModel.storeImage,
              textAlign: pw.TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 5.0,
                color: PdfColors.black,
              ),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              "Phone- ${orderHistoryController.orderHistoryDetailModel.storeName}",
              textAlign: pw.TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 5.0,
                color: PdfColors.black,
              ),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              "GSTN : 673776645547",
              textAlign: pw.TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 5.0,
                color: PdfColors.black,
              ),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              "TAX INVOICE/BILL OF SUPPLY",
              textAlign: pw.TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 5.0,
                color: PdfColors.black,
              ),
            ),
            pw.SizedBox(height: 3),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    "Order No : ${orderHistoryController.orderHistoryDetailModel.orderNo}",
                    style: const pw.TextStyle(
                      fontSize: 5.0,
                      color: PdfColors.black,
                    ),
                  ),
                  pw.Text(
                    "Date : ${orderHistoryController.orderHistoryDetailModel.orderedDate}",
                    style: const pw.TextStyle(
                      fontSize: 5.0,
                      color: PdfColors.black,
                    ),
                  ),
                ]),

            // pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 5),
                child: pw.Row(
                  children: List.generate(
                      150 ~/ 2,
                          (index) => pw.Expanded(
                        child: pw.Container(
                          color: index % 2 == 0
                              ? PdfColors.black
                              : PdfColors.white,
                          height: 0.10,
                        ),)),)),

            /// PDF Table Create

            pw.Table.fromTextArray(
              headerPadding: const pw.EdgeInsets.all(0),
              cellPadding: const pw.EdgeInsets.symmetric(vertical: 2),
              headers: tableHeaders,

              data: tableData,
              cellStyle:
                  pw.TextStyle(fontSize: 5, fontWeight: pw.FontWeight.normal),
              border: null,
              headerStyle:
                  pw.TextStyle(fontSize: 5, fontWeight: pw.FontWeight.normal),
              // headerDecoration:
              //    const pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 0.0,
              defaultColumnWidth: const pw.FlexColumnWidth(),
              // cellFormat: ,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.center,
                2: pw.Alignment.center,
                3: pw.Alignment.center,
              },
            ),
            pw.Padding(
                padding: const pw.EdgeInsets.symmetric(vertical: 5),
                child: pw.Row(
                  children: List.generate(
                      150 ~/ 2,
                          (index) => pw.Expanded(
                        child: pw.Container(
                          color: index % 2 == 0
                              ? PdfColors.black
                              : PdfColors.white,
                          height: 0.10,
                        ),)),)),
            pw.Container(
              alignment: pw.Alignment.center,
              child: pw.Row(
                children: [
                  //   pw.Spacer(flex: 6),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Padding(
                            padding:
                                const pw.EdgeInsets.only(left: 0, right: 10),
                            child: pw.Column(children: [
                              pw.Row(
                                children: [
                                  pw.Expanded(
                                    child: pw.Text(
                                      'Net total',
                                      style: pw.TextStyle(
                                        fontSize: 5,
                                        fontWeight: pw.FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  pw.Text(
                                    '${orderHistoryController.orderHistoryDetailModel.grandTotal}',
                                    style: pw.TextStyle(
                                      fontSize: 5,
                                      fontWeight: pw.FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              // pw.Divider(thickness: 0.10),
                              pw.Row(
                                children: [
                                  pw.Expanded(
                                    child: pw.Text(
                                      'You saved',
                                      style: pw.TextStyle(
                                        fontSize: 5,
                                        fontWeight: pw.FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  pw.Text(
                                    '${orderHistoryController.orderHistoryDetailModel.discount}',
                                    style: pw.TextStyle(
                                      fontSize: 5,
                                      fontWeight: pw.FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              // pw.Divider(thickness: 0.10),
                              pw.Row(
                                children: [
                                  pw.Expanded(
                                    child: pw.Text(
                                      'Total amount due',
                                      style: pw.TextStyle(
                                        fontSize: 5.0,
                                        fontWeight: pw.FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  pw.Text(
                                    ' ${orderHistoryController.orderHistoryDetailModel.paidAmount}',
                                    style: pw.TextStyle(
                                      fontSize: 5,
                                      fontWeight: pw.FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ])),
                        pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(vertical: 5),
                            child: pw.Row(
                              children: List.generate(
                                  150 ~/ 2,
                                      (index) => pw.Expanded(
                                    child: pw.Container(
                                      color: index % 2 == 0
                                          ? PdfColors.black
                                          : PdfColors.white,
                                      height: 0.10,
                                    ),)),)),
                        pw.Center(
                          child: pw.Text(
                            'GST Summary',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 5,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ),
                        pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(vertical: 5),
                            child: pw.Row(
                              children: List.generate(
                                  150 ~/ 2,
                                      (index) => pw.Expanded(
                                    child: pw.Container(
                                      color: index % 2 == 0
                                          ? PdfColors.black
                                          : PdfColors.white,
                                      height: 0.10,
                                    ),)),)),
                        pw.Table.fromTextArray(
                          cellPadding:
                              const pw.EdgeInsets.symmetric(vertical: 2),
                          headerPadding: const pw.EdgeInsets.all(0),
                          headers: tableGSTHeaders,
                          data: tableGSTData,
                          cellStyle: pw.TextStyle(
                              fontSize: 5, fontWeight: pw.FontWeight.normal),
                          border: null,
                          headerStyle: pw.TextStyle(
                              fontSize: 5, fontWeight: pw.FontWeight.normal),
                          // headerDecoration:
                          //    const pw.BoxDecoration(color: PdfColors.grey300),
                          cellHeight: 0.0,
                          defaultColumnWidth: const pw.FlexColumnWidth(),
                          // cellFormat: ,
                          cellAlignments: {
                            0: pw.Alignment.centerLeft,
                            1: pw.Alignment.center,
                            2: pw.Alignment.center,
                            3: pw.Alignment.center,
                          },
                        ),
                        // pw.Divider(height: 0.10),
                        // pw.SizedBox(height: 2),
                        pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(vertical: 5),
                            child: pw.Row(
                              children: List.generate(
                                  150 ~/ 2,
                                      (index) => pw.Expanded(
                                    child: pw.Container(
                                      color: index % 2 == 0
                                          ? PdfColors.black
                                          : PdfColors.white,
                                      height: 0.10,
                                    ),)),)),

                        pw.Center(
                          child: pw.Text(
                            ' Payment Details',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 5,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ),
                        pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(vertical: 8),
                            child: pw.Row(
                              children: List.generate(
                                  150 ~/ 2,
                                  (index) => pw.Expanded(
                                        child: pw.Container(
                                          color: index % 2 == 0
                                              ? PdfColors.black
                                              : PdfColors.white,
                                          height: 0.10,
                                        ),
                                      )),
                            )),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                ' Payment Type :',
                                style: pw.TextStyle(
                                  fontSize: 5,
                                  fontWeight: pw.FontWeight.normal,
                                ),
                              ),
                              pw.Text(
                                ' ${orderHistoryController.orderHistoryDetailModel.paymentType}',
                                style: pw.TextStyle(
                                  fontSize: 5,
                                  fontWeight: pw.FontWeight.normal,
                                ),
                              ),
                            ]),

                        pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(vertical: 5),
                            child: pw.Row(
                              children: List.generate(
                                  150 ~/ 2,
                                      (index) => pw.Expanded(
                                    child: pw.Container(
                                      color: index % 2 == 0
                                          ? PdfColors.black
                                          : PdfColors.white,
                                      height: 0.10,
                                    ),)),)),
                        pw.Center(
                          child: pw.Text(
                            'Thank You For Shopping at-',
                            style: pw.TextStyle(
                              fontSize: 5,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ),
                        pw.Center(
                          child: pw.Text(
                            "JumpQ",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 5,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]);
        },
        // footer: (context) {
        //   return pw.Column(
        //     mainAxisSize: pw.MainAxisSize.min,
        //     children: [
        //       pw.Divider(),
        //       pw.SizedBox(height: 2 * PdfPageFormat.mm),
        //       pw.Text(
        //         orderHistoryController.orderHistoryDetailModel.storeName,
        //         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //       ),
        //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
        //       pw.Row(
        //         mainAxisAlignment: pw.MainAxisAlignment.center,
        //         children: [
        //           pw.Text(
        //             orderHistoryController.orderHistoryDetailModel.storeImage,
        //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //           ),
        //           pw.Text(
        //             ""
        //           ),
        //         ],
        //       ),
        //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
        //       // pw.Row(
        //       //   mainAxisAlignment: pw.MainAxisAlignment.center,
        //       //   children: [
        //       //     pw.Text(
        //       //       'Email: ',
        //       //       style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //       //     ),
        //       //     pw.Text(
        //       //       'birla@gmail.com',
        //       //     ),
        //       //   ],
        //       // ),
        //     ],
        //   );
        // },
      ),
    );

    return FileHandlePDF.saveDocument(name: 'jumpq.pdf', pdf: pdf);
  }
}

List<List<String>> tableDataList(
    OrderHistoryController orderHistoryController) {
  List<List<String>> list2 = [];
  orderHistoryController.orderHistoryDetailModel.orderHistoryData
      ?.forEach((element) {
    List<String> list = <String>[];
    list.add(element.productName);
    list.add(element.quantity);
    list.add(element.productPrice);
    list.add(element.total);
    list2.add(list);
  });
/*  '${orderHistoryController.orderHistoryDetailModel.orderHistoryData}',
  '${orderHistoryController.orderHistoryDetailModel.totalItems}',
  '${orderHistoryController.orderHistoryDetailModel.grandTotal}',
  '${orderHistoryController.orderHistoryDetailModel.discount}',
  '${orderHistoryController.orderHistoryDetailModel.paidAmount}',*/
  return list2;
}

Widget itemName(String productName) {
  return Text(productName,
      style: const TextStyle(
          color: Colors.red, fontSize: 12, fontWeight: FontWeight.normal));
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });
  int id;
  String name;
  double price;
  String description;
}

class TableExample extends StatefulWidget {
  const TableExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TableExampleState();
  }
}

class TableExampleState extends State<TableExample> {
  List<Item> _items = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }

  List<Item> _generateItems() {
    return List.generate(4, (int index) {
      return Item(
        id: index,
        name: 'Item $index',
        price: index * 1000.00,
        description: 'Details of item $index',
      );
    });
  }

  TableRow _buildTableRow(Item item) {
    return TableRow(
        key: ValueKey(item.id),
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
        ),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(item.id.toString()),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(item.name),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(item.price.toString()),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(item.description),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Woolha.com Flutter Tutorial'),
      ),
      body: Table(
        // border: TableBorder(
        //     bottom: BorderSide(color: Colors.red, width: 2),
        //     horizontalInside: BorderSide(color: Colors.red, width: 2),
        // ),
        // border: TableBorder.all(color: Colors.red, width: 2),
        border: TableBorder.symmetric(
          inside: const BorderSide(color: Colors.blue, width: 2),
          outside: const BorderSide(color: Colors.red, width: 5),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
        defaultColumnWidth: const IntrinsicColumnWidth(),
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(20),
          1: FlexColumnWidth(3),
          2: MaxColumnWidth(FlexColumnWidth(2), FractionColumnWidth(0.3)),
          3: FixedColumnWidth(150),
        },

        // textDirection: TextDirection.rtl,
        textBaseline: TextBaseline
            .alphabetic, // Pass this argument when using [TableCellVerticalAlignment.fill]
        children: _items.map((item) => _buildTableRow(item)).toList(),
      ),
    );
  }
}



