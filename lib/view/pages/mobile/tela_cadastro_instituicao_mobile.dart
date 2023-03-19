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

class CadastroInstituicaoMobilePage extends StatefulWidget {
  const CadastroInstituicaoMobilePage({super.key});

  @override
  State<CadastroInstituicaoMobilePage> createState() =>
      _CadastroInstituicaoMobilePageState();
}

class _CadastroInstituicaoMobilePageState
    extends State<CadastroInstituicaoMobilePage> {
  final ControllerStakeHolders _controller = ControllerStakeHolders();
  final formKey = GlobalKey<FormState>();
  bool password = true;
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
                    image: AssetImage('assets/images/img_fundo_mobile.png'),
                    fit: BoxFit.cover)),
          ),
          /*Image.asset(
          'assets/images/img_fundo_web.png',
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
        ),*/

          Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      height: altura - 40,
                      margin: const EdgeInsets.all(20),
                      width: largura / 3,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                              'assets/icons/icons8-fita-de-câncer-color/icons8-fita-de-câncer-48.png'),
                          const SizedBox(height: 20),
                          Text(
                            'Instituição',
                            style: GoogleFonts.roboto(
                              color: Colors.purple.shade400,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Junte-se ao OnColo!\nSaúde da mulher, inteligente e humanizada',
                              style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CaixaDeTexto(
                              obs: false,
                              enable: true,
                              keyboardType: TextInputType.text,
                              labelText: "Nome Fantasia: ",
                              hintText:
                                  "Digite aqui o seu nome fantasia da sua empresa",
                              icon: Icons.branding_watermark,
                              controller: _controller.nomeFantasia,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CaixaDeTexto(
                              labelText: "CNPJ: ",
                              hintText: "Digite aqui o seu CNPJ",
                              obs: false,
                              enable: true,
                              keyboardType: TextInputType.number,
                              icon: Icons.shopping_bag,
                              controller: _controller.cnpj,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CaixaDeTexto(
                              labelText: "E-mail: ",
                              hintText: "Digite aqui o seu nome de usuário",
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
                          // ignore: prefer_const_constructors
                          ElevatedButton(
                            onPressed: () async {
                              final code =
                                  await _controller.cadastrarInstituicao(
                                      context: context, formKey: formKey);
                              _controller.changedLoad(false);
                              String text = '', route = '';
                              if (code == 200 || code == 201) {
                                text = 'Cadastro efetuado!';
                                //route = '/login';
                                Navigator.of(context).pushNamed('/ListarFisio');

                                route = '/ListarFisio';
                              } else {
                                text = 'Tente novamente!';
                              }
                              Text(text);
                              //Para mobile
                              SnackBar(
                                content: Text(text),
                                action: SnackBarAction(
                                  label: '',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              // Navigator.of(context).pushNamed(route);
                              _controller.api.listarInstituicoes();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: Cores().orange.withOpacity(1.0),
                                  ),
                                ),
                              ),
                              elevation: MaterialStateProperty.all<double>(5),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.purple.shade400),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(250, 50)),
                            ),
                            child: Text(
                              "CADASTRAR",
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'roboto',
                              ),
                            ),
                          ),
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
        ],
      ),
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
