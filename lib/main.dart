// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:oncolo/view/pages/mobile/tela_cadastro_instituicao_mobile.dart';
import 'package:oncolo/view/pages/mobile/tela_login_mobile.dart';
import 'package:oncolo/view/pages/web/tela_cadastro_fisio.dart';
import 'package:oncolo/view/pages/web/tela_cadastro_inst_web.dart';
import 'package:oncolo/view/pages/mobile/tela_inicial_mobile.dart';
import 'package:oncolo/view/pages/web/tela_listar_fisio_web.dart';
import 'package:oncolo/view/pages/web/tela_listar_paciente_web.dart';
import 'package:oncolo/view/pages/web/tela_login_web.dart';
import 'package:oncolo/view/pages/mobile/tela_cadastro_fisio.dart';
import 'package:oncolo/view/pages/mobile/tela_cadastro_paciente_mobile.dart';
import 'package:oncolo/view/pages/mobile/tela_editar_fisio_mobile.dart';
import 'package:oncolo/view/pages/mobile/tela_listar_fisio_mobile.dart';
import 'package:oncolo/view/pages/mobile/tela_listar_paciente_mobile.dart';
import 'package:oncolo/view/pages/web/tela_newlogin_web.dart';
import 'control/repository/api_request_stakeholders.dart';
import 'package:oncolo/view/pages/responsive_layout.dart';

Future<void> main() async {
  APICallsStakeholders().listarInstituicoes();
  APICallsStakeholders().listarFisioterapeutas();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OnColo v1',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          initialRoute: '/ListarFisio',
          routes: {
            '/': (context) => ResponsiveLayout(
                desktop: TelaLoginWeb(), mobile: HomePage()), //HomePage(),
            '/login': (context) => const LoginPage(),
            '/loginWeb': (context) => const LoginWeb(),
            '/cadastroInstituicao': (context) => ResponsiveLayout(
                desktop: CadastroInstituicaoPage(),
                mobile: CadastroInstituicaoMobilePage()),
            '/homePage': (context) => const HomePage(),
            '/CadastrarFisio': (context) => ResponsiveLayout(
                desktop: TelaCadastroFisioterapeutaWeb(),
                mobile: TelaCadastroFisioterapeuta()),
            '/CadastrarPaciente': (context) => TelaCadastroPaciente(),
            // mobile: TelaCadastroPaciente()),
            '/EditarFisio': (context) => TelaEditarFisioterapeuta(),
            '/EditarPaciente': (context) => TelaEditarFisioterapeuta(),
            '/ListarFisio': (context) => ResponsiveLayout(
                desktop: TelaListarFisioterapeutaWeb(),
                mobile: TelaListarFisioterapeuta()),
            '/ListarPaciente': (context) => ResponsiveLayout(
                desktop: TelaListarPacienteWeb(), mobile: TelaListarPaciente()),
          });
    });
  }
}
