import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jump_q/utils/palette.dart';

class InputField extends StatelessWidget{
  final String? label;
  final Color labelColor;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String)? validator;
  final bool enabled;
  final InputDecoration? decoration;
  final bool optional;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  final bool? onscureText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillType;
  final List<TextInputFormatter>? inputFormatter;
  final bool autofocus;
  final bool enableInteractiveSelection;
  final FocusNode? focusNode;
  final bool enableSuggestions;
  final EdgeInsets? contentPadding;
   InputField({this.label, this.labelColor = Palette.colorPrimaryDark, this.hint,required  this.controller, this.validator, this.enabled = true, this.decoration, this.optional=false, this.suffixIcon, this.onChange, this.onscureText, this.keyboardType, this.autofillType, this.inputFormatter, this.autofocus=false, this.enableInteractiveSelection= true, this.focusNode, this.enableSuggestions = false, this.contentPadding});

  @override
  Widget build(BuildContext context) {
return SizedBox();
  }

//Widget get labelWidget => label !=null?Form
}