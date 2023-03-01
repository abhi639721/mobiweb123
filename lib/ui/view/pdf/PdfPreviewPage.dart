import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jump_q/models/order/order_history_detail_model.dart';

import 'package:printing/printing.dart';
import '../../../services/navigator.dart';
import 'order_summery_invoice.dart';

class PdfPreviewPage extends StatelessWidget {
  static String routeName = "/pdf_view";
  static Future<bool?> start<bool>(String oderId) {
    return navigateTo<bool>(routeName, currentPageTitle: "Invoice",);
  }
  final OrderHistoryDetailModel invoice;
  const PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(invoice),
      ),
    );
  }
}