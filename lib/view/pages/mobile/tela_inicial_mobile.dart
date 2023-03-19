import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oncolo/model/fisioterapeutas/fisioterapeutas.dart';
import 'package:oncolo/view/widgets/botao.dart';
import 'package:oncolo/view/widgets/botaoHome.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  login() {
    Navigator.of(context).pushNamed('/login');
  }

  instituicao() {
    Navigator.of(context).pushNamed('/cadastroInstituicao');
  }

  fisioterapeuta() {
    Navigator.of(context).pushNamed('/CadastrarFisio');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/img_fundo_web.png'),
                    fit: BoxFit.cover)),
          ),
          Form(
            child: Center(
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
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/icons/icons8-fita-de-câncer-color/icons8-fita-de-câncer-96.png'),
                              //const SizedBox(height: 20),
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
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BotaoHome(
                                    texto: "LOGIN",
                                    onPressed: login,
                                    textColor: Colors.white,
                                    background: Colors.purple.shade400,
                                    borda: Colors.orange),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BotaoHome(
                                    texto: "CADASTRE-SE INSTITUIÇÃO",
                                    onPressed: instituicao,
                                    textColor: Colors.white,
                                    background: Colors.purple.shade200,
                                    borda: Colors.blue.shade700),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BotaoHome(
                                    texto: "CADASTRE-SE FISIOTERAPEUTA",
                                    onPressed: fisioterapeuta,
                                    textColor: Colors.deepOrange.shade900,
                                    background: Colors.white,
                                    borda: Colors.orange),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                  height: 60,
                                  width: 150,
                                  child: Image.asset(
                                    'assets/images/logo_UFS.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
