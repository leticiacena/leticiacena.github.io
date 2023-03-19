import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oncolo/view/resources/strings.dart';
import 'package:oncolo/view/widgets/botao.dart';
import 'package:oncolo/view/widgets/caixaDeTexto.dart';

import '../../../control/controller_stakeholders.dart';
import '../../resources/colors.dart';

/// Classe de cadastro de pacientes.
class TelaCadastroPaciente extends StatefulWidget {
  const TelaCadastroPaciente({super.key});

  @override
  State<TelaCadastroPaciente> createState() => _TelaCadastroPacienteState();
}

class _TelaCadastroPacienteState extends State<TelaCadastroPaciente> {
  final ControllerStakeHolders controller = ControllerStakeHolders();
  final formKey = GlobalKey<FormState>();
  String nome = '';
  String idade = '';
  String altura = '';
  String peso = '';
  String matricula = '';
  double imc = 0;

  /// Construção do Design da tela de cadastro de pacientes.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          key: formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 15.0),
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
                      StringsOn.cadastroPaciente,
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
                        obs: false,
                        labelText: StringsOn.matricula,
                        hintText: StringsOn.matriculaPHint,
                        icon: Icons.add,
                        keyboardType: TextInputType.text,
                        enable: true,
                        controller: controller.matricula,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        obs: false,
                        labelText: StringsOn.nome,
                        hintText: StringsOn.nomePHint,
                        icon: Icons.person,
                        keyboardType: TextInputType.name,
                        enable: true,
                        controller: controller.nome,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        obs: false,
                        labelText: 'Data de nascimento',
                        hintText: StringsOn.pesoPHint,
                        icon: Icons.child_care,
                        keyboardType: TextInputType.number,
                        enable: true,
                        controller: controller.dataNascimento,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        obs: false,
                        labelText: 'Telefone',
                        hintText: StringsOn.pesoPHint,
                        icon: Icons.phone,
                        keyboardType: TextInputType.number,
                        enable: true,
                        controller: controller.telefone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        obs: false,
                        labelText: 'CPF',
                        hintText: StringsOn.pesoPHint,
                        icon: Icons.badge,
                        keyboardType: TextInputType.number,
                        enable: true,
                        controller: controller.cpf,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        obs: false,
                        labelText: StringsOn.altura,
                        hintText: StringsOn.alturaPHint,
                        icon: Icons.straighten,
                        keyboardType: TextInputType.number,
                        enable: true,
                        controller: controller.altura,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        obs: false,
                        labelText: StringsOn.peso,
                        hintText: StringsOn.pesoPHint,
                        icon: Icons.balance,
                        keyboardType: TextInputType.number,
                        enable: true,
                        controller: controller.peso,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(46, 5, 5, 5),
                      child: Row(children: [
                        Text(StringsOn.imc,
                            style: TextStyle(
                                color: Cores().purple.withOpacity(1.0))),
                        Text(imc.toStringAsFixed(2))
                      ]),
                    ),
                    const SizedBox(height: 40.0),
                    Botao(
                      texto: StringsOn.cadastrar.toUpperCase(),
                      onPressed: () async {
                        await controller.cadastrarPaciente(
                            context: context, formKey: formKey);
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    ]));
  }
}
