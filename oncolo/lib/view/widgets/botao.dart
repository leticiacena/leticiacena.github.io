import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oncolo/control/controller_stakeholders.dart';
import 'package:oncolo/view/resources/colors.dart';

class Botao extends StatefulWidget {
  final String texto;
  Function onPressed;

  Botao({super.key, required this.texto, required this.onPressed});

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  ControllerStakeHolders _controller = ControllerStakeHolders();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Cores().orange.withOpacity(1.0),
            ),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(5),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.purple.shade400),
        minimumSize: MaterialStateProperty.all<Size>(const Size(250, 50)),
      ),
      child: Text(
        widget.texto,
        style: const TextStyle(
          fontSize: 15,
          fontFamily: 'roboto',
        ),
      ),
    );
  }
}
