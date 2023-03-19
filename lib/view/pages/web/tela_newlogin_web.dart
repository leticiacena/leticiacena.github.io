import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oncolo/control/controller_stakeholders.dart';
import 'package:oncolo/view/resources/colors.dart';
import 'package:oncolo/view/resources/strings.dart';

import '../../widgets/botao.dart';
import '../../widgets/caixaDeTexto.dart';

class TelaLoginWeb extends StatefulWidget {
  const TelaLoginWeb({super.key});

  @override
  State<TelaLoginWeb> createState() => _TelaLoginWebState();
}

class _TelaLoginWebState extends State<TelaLoginWeb> {
  final ControllerStakeHolders _controller = ControllerStakeHolders();
  final formKey = GlobalKey<FormState>();
  bool password = true;
  login() async {
    final code = await _controller.cadastrarInstituicao(
        context: context, formKey: formKey);
    _controller.changedLoad(false);
    String text = '', route = '';
    if (code == 200) {
      text = 'Cadastro efetuado!';
      route = '/login';
    } else {
      text = 'Tente novamente!';
    }
    Text(text);
    //Para mobile

    Navigator.of(context).pushNamed('/ListarFisio');
    _controller.api.listarInstituicoes();
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 162, 245),
      body: Stack(children: [
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
            Expanded(
              child: SizedBox(
                width: largura / 5,
                child: Form(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            height: 550,
                            margin: const EdgeInsets.all(20),
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'assets/icons/icons8-fita-de-câncer-color/icons8-fita-de-câncer-48.png'),
                                Text(
                                  'Login',
                                  style: GoogleFonts.roboto(
                                    color: Colors.purple.shade400,
                                    //color: const Color.fromRGBO(124, 36, 192, 1),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CaixaDeTexto(
                                    labelText: "E-mail: ",
                                    hintText:
                                        "Digite aqui o seu nome de usuário",
                                    obs: false,
                                    enable: true,
                                    keyboardType: TextInputType.emailAddress,
                                    icon: Icons.person,
                                    controller: _controller.email,
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
                                    controller: _controller.senha,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Botao(texto: "LOGIN", onPressed: login),
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
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

String? emptyValidator(String? text) {
  if (text == null || text.isEmpty) {
    return StringsOn.errorMessageEmptyField;
  }
}

String? emptyValidatorPassword(String? senha) {
  final senhaDigitada = emptyValidator(senha);
  if (senhaDigitada == null && senha != null) {
    if (senha.length < 7) {
      return StringsOn.errorMinCaracteresCpf;
    }
  } else {
    return StringsOn.errorMessageEmptyField;
  }
}
