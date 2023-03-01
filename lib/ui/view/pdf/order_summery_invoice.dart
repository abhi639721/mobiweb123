import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import '../../../models/order/order_history_detail_model.dart';
Future<Uint8List> makePdf(OrderHistoryDetailModel invoice) async {
  final pdf = Document();
  final imageLogo = MemoryImage((await rootBundle.load('assets/png/app_logo.png')).buffer.asUint8List());
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Attention to: ${invoice.storeName}"),
                    Text(invoice.storeAddress),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(imageLogo),
                )
              ],
            ),
            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    Padding(
                      child: Text(
                        'INVOICE FOR PAYMENT',
                        style: Theme.of(context).header4,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ],
                ),
                ...invoice.orderHistoryData!.map(
                      (e) => TableRow(
                    children: [
                      Expanded(
                        child: paddedText("${e.productName}  *  ${e.quantity}"),
                        flex: 2,
                      ),
                      Expanded(
                        child: paddedText("\$${e.totalAmount}"),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                TableRow(
                  children: [
                    paddedText('TAX', align: TextAlign.right),
                    paddedText('\$${(invoice.paidAmount * 0.1).toStringAsFixed(2)}'),
                  ],
                ),
                TableRow(
                  children: [paddedText('TOTAL', align: TextAlign.right), paddedText('\$${(invoice.paidAmount * 1.1).toStringAsFixed(2)}')],
                )
              ],
            ),
            Padding(
              child: Text(
                "THANK YOU FOR YOUR CUSTOM!",
                style: Theme.of(context).header2,
              ),
              padding: EdgeInsets.all(20),
            ),
            Text("Please forward the below slip to your accounts payable department."),
            Divider(
              height: 1,
              borderStyle: BorderStyle.dashed,
            ),
            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    paddedText('Account Number'),
                    paddedText(
                      '1234 1234',
                    )
                  ],
                ),
                TableRow(
                  children: [
                    paddedText(
                      'Account Name',
                    ),
                    paddedText(
                      'ADAM FAMILY TRUST',
                    )
                  ],
                ),
                TableRow(
                  children: [
                    paddedText(
                      'Total Amount to be Paid',
                    ),
                    paddedText('\$${(invoice.paidAmount * 1.1).toStringAsFixed(2)}')
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                'Please ensure all cheques are payable to the ADAM FAMILY TRUST.',
                style: Theme.of(context).header3.copyWith(
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    ),
  );
  return pdf.save();
}

Widget paddedText(
    final String text, {
      final TextAlign align = TextAlign.left,
    }) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );