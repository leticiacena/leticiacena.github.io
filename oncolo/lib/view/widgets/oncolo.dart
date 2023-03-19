import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oncolo/view/resources/colors.dart';
import 'package:oncolo/view/resources/strings.dart';

import '../widgets/botao.dart';
import '../widgets/caixaDeTexto.dart';

class OnColoBrand extends StatefulWidget {
  Widget element;
  OnColoBrand({super.key, required this.element});

  @override
  State<OnColoBrand> createState() => _OnColoBrandState();
}

class _OnColoBrandState extends State<OnColoBrand> {
  cadastrar() {}

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 162, 245),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/img_fundo_web.png'),
                    fit: BoxFit.cover)),
          ),
          /*Image.asset(
          'assets/images/img_fundo_web.png',
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
        ),*/

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(100, 30, 10, 190),
                    child: Image.asset(
                      'assets/icons/icons8-fita-de-câncer-color/icons8-fita-de-câncer-96.png',
                      fit: BoxFit.cover,
                      //height: 80,
                      //width: 70,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  /*  Column(
                  //margin: const EdgeInsets.symmetric(horizontal: 100),
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [*/
                  SizedBox(
                    width: largura / 2,
                    height: altura / 4,
                    child: Text(StringsOn.appName,
                        style: const TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.w700,
                            color: Colors.purple,
                            height: 0.9)),
                  ),
                  /*  Text(StringsOn.appCalltoAction,
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                        height: 0.9)),
                   ],
                ),**/
                ],
              ),
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        height: 550,
                        margin: const EdgeInsets.all(20),
                        alignment: Alignment.topLeft,
                        child: widget.element),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
