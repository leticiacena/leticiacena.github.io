import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oncolo/view/resources/strings.dart';
import 'package:oncolo/view/resources/colors.dart';

import '../../control/controller_stakeholders.dart';

class CaixaDeTexto extends StatefulWidget {
  String labelText;
  String hintText;
  IconData icon;
  bool obs;
  bool enable;
  String? initialValue;

  TextInputType keyboardType;
  TextEditingController? controller;

  CaixaDeTexto({
    super.key,
    this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.obs,
    required this.enable,
    this.controller,
    required this.keyboardType,
  });

  @override
  State<CaixaDeTexto> createState() => _CaixaDeTextoState();
}

class _CaixaDeTextoState extends State<CaixaDeTexto> {
  var temController = true;

  @override
  void initState() {
    if (widget.controller == null) {
      temController = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: temController ? widget.controller : null,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enable,
      obscureText: widget.obs,
      keyboardType: widget.keyboardType,
      initialValue: temController ? null : widget.initialValue ?? null,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        icon: Icon(widget.icon),
        hintText: widget.labelText,
        labelText: widget.labelText,
        hoverColor: Colors.purple,
        focusColor: Colors.purple,
        iconColor: Colors.purple,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
