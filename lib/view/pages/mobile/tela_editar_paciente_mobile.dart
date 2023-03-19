// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oncolo/view/resources/colors.dart';
import 'package:oncolo/view/resources/strings.dart';
import 'package:oncolo/view/widgets/botao.dart';
import 'package:oncolo/view/widgets/caixaDeTexto.dart';
import 'package:oncolo/model/pacientes/pacientes.dart';
import '../../../control/controller_stakeholders.dart';

/// Classe de editar pacientes.
class TelaEditarPaciente extends StatefulWidget {
  Pacientes? paciente;

  TelaEditarPaciente({super.key, this.paciente});

  @override
  State<TelaEditarPaciente> createState() => _TelaEditarPacienteState();
}

class _TelaEditarPacienteState extends State<TelaEditarPaciente> {
  final ControllerStakeHolders _controller = ControllerStakeHolders();

  @override
  void initState() {
    print(widget.paciente);
    super.initState();
  }

  /// Construção do Design da tela de edição de pacientes.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/img_fundo_mobile.png',
              fit: BoxFit.fill,
            )),
        Form(
            child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: Colors.purple,
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/icons/icons8-fita-de-câncer-color/icons8-fita-de-câncer-48.png'),
                  const SizedBox(height: 20),
                  Text(
                    'Editar Paciente',
                    style: GoogleFonts.roboto(
                      color: const Color.fromRGBO(124, 36, 192, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CaixaDeTexto(
                      controller: _controller.nome,
                      initialValue: widget.paciente?.nome,
                      keyboardType: TextInputType.name,
                      enable: true,
                      obs: false,
                      labelText: "Nome: ",
                      hintText: "Digite aqui o seu nome",
                      icon: Icons.person,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CaixaDeTexto(
                      controller: _controller.email,
                      initialValue: widget.paciente?.email,
                      keyboardType: TextInputType.emailAddress,
                      enable: true,
                      obs: false,
                      labelText: "Nome: ",
                      hintText: "Digite aqui o nome da paciente",
                      icon: Icons.email,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CaixaDeTexto(
                      controller: _controller.matricula,
                      initialValue: widget.paciente?.matricula,
                      keyboardType: TextInputType.name,
                      enable: false,
                      obs: false,
                      labelText: "Matrícula: ",
                      hintText: "Digite aqui a matrícula da paciente",
                      icon: Icons.add,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Botao(
                      texto: StringsOn.salvar.toUpperCase(), onPressed: () {}),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.of(context).pushNamed('/');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Cores().orange.withOpacity(1),
                          ),
                        ),
                      ),
                      elevation: MaterialStateProperty.all<double>(5),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(150, 50)),
                    ),
                    child: const Text(
                      'CANCELAR',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'roboto',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ]),
    ));
  }
}
