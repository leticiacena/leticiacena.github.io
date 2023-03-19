import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../control/controller_stakeholders.dart';

class BotaoHome extends StatefulWidget {
  final String texto;
  Function onPressed;
  Color borda;
  Color background;
  Color textColor;

  BotaoHome(
      {super.key,
      required this.texto,
      required this.onPressed,
      required this.borda,
      required this.background,
      required this.textColor});

  @override
  State<BotaoHome> createState() => _BotaoHomeState();
}

class _BotaoHomeState extends State<BotaoHome> {
  @override
  Widget build(BuildContext context) {
    ControllerStakeHolders _controller = ControllerStakeHolders();
    return ElevatedButton(
      onPressed: () => widget.onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: widget.borda.withOpacity(1.0),
            ),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(5),
        backgroundColor: MaterialStateProperty.all<Color>(widget.background),
        minimumSize: MaterialStateProperty.all<Size>(const Size(250, 50)),
      ),
      child: Text(
        widget.texto,
        style: TextStyle(
          color: widget.textColor,
          fontSize: 12,
          fontFamily: 'roboto',
        ),
      ),
    );
  }
}
