import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oncolo/control/controller_stakeholders.dart';
import 'package:oncolo/view/resources/colors.dart';
import 'package:oncolo/view/resources/strings.dart';

import '../../widgets/botao.dart';
import '../../widgets/caixaDeTexto.dart';

class CadastroInstituicaoPage extends StatefulWidget {
  const CadastroInstituicaoPage({super.key});

  @override
  State<CadastroInstituicaoPage> createState() =>
      _CadastroInstituicaoPageState();
}

class _CadastroInstituicaoPageState extends State<CadastroInstituicaoPage> {
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
                width: largura / 4,
                child: Form(
                  key: formKey,
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
                            height: altura - 40,
                            margin: const EdgeInsets.all(20),
                            width: largura / 3,
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                const Text("Cadastro Instituição",
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 40),
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
                                    labelText: "Usuário: ",
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
                                // ignore: prefer_const_constructors
                                ElevatedButton(
                                  onPressed: () async {
                                    final code =
                                        await _controller.cadastrarInstituicao(
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
                                    final snackBar = SnackBar(
                                      content: Text(text),
                                      action: SnackBarAction(
                                        label: '',
                                        onPressed: () {
                                          // Some code to undo the change.
                                        },
                                      ),
                                    );
                                    Navigator.of(context).pushNamed(route);
                                    _controller.api.listarInstituicoes();
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color:
                                              Cores().orange.withOpacity(1.0),
                                        ),
                                      ),
                                    ),
                                    elevation:
                                        MaterialStateProperty.all<double>(5),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.purple.shade400),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
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
