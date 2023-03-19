import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oncolo/control/controller_stakeholders.dart';
import 'package:oncolo/view/resources/colors.dart';
import 'package:oncolo/view/resources/strings.dart';
import 'package:oncolo/view/widgets/botao.dart';
import 'package:oncolo/view/widgets/caixaDeTexto.dart';
//import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ControllerStakeHolders controller = ControllerStakeHolders();
  login() {
    Navigator.of(context).pushNamed('/ListarPaciente');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img_fundo_mobile.png'),
                  fit: BoxFit.cover)),
        ),
        /*   Image.asset(
          'assets/icons/icons8-fita-de-câncer-color/icons8-fita-de-câncer-48.png',
          fit: BoxFit.fill,
        ),*/
        Form(
          child: ListView(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            'assets/icons/icons8-fita-de-câncer-color/icons8-fita-de-câncer-96.png'),
                        Text(
                          'OnColo',
                          style: GoogleFonts.roboto(
                            color: Colors.purple.shade400,
                            //color: const Color.fromRGBO(124, 36, 192, 1),
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CaixaDeTexto(
                            labelText: "E-mail: ",
                            hintText: "Digite aqui o seu nome de usuário",
                            obs: false,
                            enable: true,
                            keyboardType: TextInputType.emailAddress,
                            icon: Icons.person,
                            controller: controller.email,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CaixaDeTexto(
                            labelText: "Senha: ",
                            hintText: "Digite aqui a sua senha",
                            obs: true,
                            enable: true,
                            keyboardType: TextInputType.text,
                            icon: Icons.lock,
                            controller: controller.senha,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Botao(texto: "LOGIN", onPressed: login),
                        /*ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/CadastrarFisio');
                            },
                            style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blueAccent)),
                            child: Text("Cadastre-se Fisioterapeuta")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/cadastroInstituicaoMobile');
                            },
                            style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue)),
                            child: Text("Cadastre-se Instituição")),
                        */
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 80,
                            width: 150,
                            child: Image.asset(
                              'assets/images/logo_UFS.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
