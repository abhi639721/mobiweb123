import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jump_q/controllers/kart/KartController.dart';
import 'package:jump_q/theme/my_theme.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  final controller=Get.find<KartController>();
  String _selectedGender = 'Cash on counter';
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ListTile(
                leading: Radio<String>(
                  activeColor: MyColors.statusBarColor,
                  value: 'Cash on counter',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                      _showMyDialog("Cash on counter");
                      //controller.caseOnCounter.value=_selectedGender;
                    });
                  },
                ),
                title: const Text('Cash on counter'),
              ),
              ListTile(
                leading: Radio<String>(
                  activeColor: MyColors.statusBarColor,
                  value: 'Pay Online',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      print("Pay Online");
                      _selectedGender = value!;
                     // controller.caseOnCounter.value=_selectedGender;
                    });
                  },
                ),
                title: const Text('Pay Online'),
              ),

            ],
          ),
    );
  }
  Future<void> _showMyDialog(String paymentMethod) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(paymentMethod),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text('Are you sure want to  $paymentMethod?'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                controller.callCreateAtCOCOrderApi(paymentType: paymentMethod);
              },
            ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();

                },
              )],)
          ],
        );
      },
    );
  }
}