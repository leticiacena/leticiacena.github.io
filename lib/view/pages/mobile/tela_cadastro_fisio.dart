// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oncolo/control/controller_stakeholders.dart';
import 'package:oncolo/view/resources/colors.dart';
import 'package:oncolo/view/resources/strings.dart';
import 'package:oncolo/view/widgets/botao.dart';
import 'package:oncolo/view/widgets/caixaDeTexto.dart';
import 'package:oncolo/model/fisioterapeutas/fisio_type.dart';

/// Classe de cadastro de fisioterapeutas.
class TelaCadastroFisioterapeuta extends StatefulWidget {
  const TelaCadastroFisioterapeuta({super.key});

  @override
  State<TelaCadastroFisioterapeuta> createState() =>
      _TelaCadastroFisioterapeutaState();
}

class _TelaCadastroFisioterapeutaState
    extends State<TelaCadastroFisioterapeuta> {
  final ControllerStakeHolders _controller = ControllerStakeHolders();
  final formKey = GlobalKey<FormState>();

  String nome = '';
  String email = '';
  String senha = '';
  String matricula = '';

  /// Função que retorna se cadastro de fisioterapeutas foi efetuado ou não.
  cadastrar() async {
    final code = await _controller.cadastrarFisioterapeuta(
        context: context, formKey: formKey);
    _controller.changedLoad(false);
    _controller.api.listarFisioterapeutas();
    //Navigator.of(context).pushNamed('/ListarFisio');

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

    /// Para mobile
    final snackBar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }

  /// Construção do Design da tela de cadastro de fisioterapeutas.
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
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  /*border: const Border.fromBorderSide(
                    BorderSide(
                      color: Colors.purple,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                  ),*/
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/icons/icons8-fita-de-câncer-color/icons8-fita-de-câncer-48.png'),
                    const SizedBox(height: 20),
                    Text(
                      'Fisioterapeuta',
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
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        controller: _controller.nome,
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
                        keyboardType: TextInputType.emailAddress,
                        enable: true,
                        obs: false,
                        labelText: "Email: ",
                        hintText: "Digite aqui o seu email",
                        icon: Icons.email,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        controller: _controller.senha,
                        keyboardType: TextInputType.name,
                        enable: true,
                        obs: true,
                        labelText: "Senha: ",
                        hintText: "Digite aqui a sua senha",
                        icon: Icons.lock,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CaixaDeTexto(
                        controller: _controller.matricula,
                        enable: true,
                        keyboardType: TextInputType.name,
                        obs: false,
                        labelText: "Matrícula: ",
                        hintText: "Digite aqui a sua matrícula",
                        icon: Icons.add,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Botao(texto: "CADASTRAR", onPressed: cadastrar),
                  ],
                ),
              )
            ],
          )),
    ]));
  }
}
