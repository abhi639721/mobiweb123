
import 'package:flutter/material.dart';

import 'package:jump_q/services/navigator.dart';
import '../../../../../models/product/product.dart';
class MyInvoice extends StatefulWidget {
  const MyInvoice({Key? key}) : super(key: key);

  @override
  _MyInvoiceState createState() => _MyInvoiceState();
  static String routeName = "/Mynvoice";
  static Future<bool?> start<bool>(String oderId) {
    return navigateTo<bool>(routeName, currentPageTitle: "Invoice",);
  }

}

class _MyInvoiceState extends State<MyInvoice> with WidgetsBindingObserver {
  final List<Product> _products = [];

  String _email = '';
  Product? _product;
  MyInvoice? _invoice;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

  /*  InvoiceNinja.configure(
      'KEY', // Set your company key or use 'KEY' to test
      url: 'https://demo.invoiceninja.com', // Set your selfhost app URL
      debugEnabled: true,
    );*/

   /* InvoiceNinja.products.load().then((products) {
      setState(() {
        _products = products.cast<Product>();
      });
    });*/
  }

  void _createInvoice() async {
   /* if (_product == null) {
      return;
    }


    var client = Client.forContact(email: _email);
    client = await InvoiceNinja.clients.save(client);

    var invoice = Invoice.forClient(client, products: []);
    invoice = await InvoiceNinja.invoices.save(invoice);

    setState(() {
      _invoice = invoice;
    });*/
  }

  void _viewPdf() {
    if (_invoice == null) {
      return;
    }


   /* launch(
      'https://docs.google.com/gview?embedded=true&url=${_invoice!.pdfUrl}',
      forceWebView: true,
    );*/
  }

  void _viewPortal() {
    if (_invoice == null) {
      return;
    }

   /* final invitation = _invoice!.invitations.first;
    launch(invitation.url);*/
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_invoice == null || state != AppLifecycleState.resumed) {
      return;
    }

   /* final invoice = await InvoiceNinja.invoices.findByKey(_invoice!.key);

    if (invoice.isPaid) {
      // ...
    }*/
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Ninja Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email),
                    ),
                    onChanged: (value) => setState(() => _email = value),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  DropdownButtonFormField<Product>(
                    decoration: const InputDecoration(
                      labelText: 'Product',
                    ),
                    onChanged: (value) => setState(() => _product = value),
                    items: _products
                        .map((product) => DropdownMenuItem(
                      value: product,
                      child: Text(product.storeId),
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: (_email.isNotEmpty && _product != null)
                        ? () => _createInvoice()
                        : null,
                    child: const Text('Create Invoice'),
                  ),
                  ElevatedButton(
                    onPressed: (_invoice != null) ? () => _viewPdf() : null,
                    child: const Text('View PDF'),
                  ),
                  ElevatedButton(
                    onPressed: (_invoice != null) ? () => _viewPortal() : null,
                    child: const Text('View Portal'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
