
import 'package:flutter/material.dart';
import 'package:jump_q/theme/my_theme.dart';


import 'package:flutter/material.dart';


import 'compdents/text_field_container.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    //this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: MyColors.kPrimaryLightColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: MyColors.kPrimaryLightColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

