import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oncolo/control/controller_stakeholders.dart';
import 'package:oncolo/model/fisioterapeutas/fisioterapeutas.dart';

import 'package:oncolo/view/widgets/listViewer.dart';
import 'package:oncolo/model/fisioterapeutas/fisio_type.dart';

import '../../../control/repository/api_request_stakeholders.dart';

/// Classe de listagem de fisioterapeutas cadastrados.
class TelaListarFisioterapeutaWeb extends StatefulWidget {
  const TelaListarFisioterapeutaWeb({super.key});

  @override
  State<TelaListarFisioterapeutaWeb> createState() =>
      _TelaListarFisioterapeutaWebState();
}

class _TelaListarFisioterapeutaWebState
    extends State<TelaListarFisioterapeutaWeb>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  ControllerStakeHolders _controller = ControllerStakeHolders();
  late Future<List<Fisioterapeuta>> fisioterapeutas;

  /// Função que chama a tela de editar fisioterapeuta.
  chamarTelaEditar() {
    Navigator.of(context).pushNamed('/EditarFisio');
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    fisioterapeutas = APICallsStakeholders().listarFisioterapeutas();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// Lista de fisioterapeuta para testes e exibição na tela.

  validacao(List<Fisioterapeuta> fisio) async {
    List<Fisioterapeuta> fisio =
        await _controller.listarFisioterapeuta(context: context);
    if (fisio.isEmpty) {
      return 'Não há Fisioterapeuta cadastrado. Ou houve erro na sua requisição';
    }
  }

  /// Construção do Design da tela de listagem de fisioterapeutas.
  ///

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.white,
        bottom: TabBar(
          indicatorColor: Colors.purple,
          labelColor: Colors.purple,
          labelStyle: const TextStyle(fontSize: 10),
          controller: tabController,
          tabs: const [
            Tab(
              text: 'Fisioterapeutas',
              icon: Icon(
                Icons.person_outline,
                color: Colors.purple,
              ),
            ),
            Tab(
              text: 'Formulários',
              icon: Icon(
                Icons.assessment_outlined,
                color: Colors.purple,
              ),
            ),
            Tab(
              text: 'Gráficos',
              icon: Icon(
                Icons.bar_chart_outlined,
                color: Colors.purple,
              ),
            ),
            Tab(
              text: 'Perfil',
              icon: Icon(
                Icons.person,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            height: 150,
            width: 600,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.purple,
                  width: 2.5,
                  style: BorderStyle.solid,
                ),
                bottom: BorderSide(
                  color: Colors.purple,
                  width: 2.5,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/img_fundo_web.png',
                        height: altura / 4,
                        width: largura,
                        fit: BoxFit.fitWidth),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 80),
                        child: Text(
                          'Fisioterapeutas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 7)),
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: 'Pesquisar',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(10, 48)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.loupe,
                              color: Colors.blue,
                              size: 29,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  '/CadastrarFisio'); // função para executar quando o botão de enviar for pressionado
                            },
                          ),
                        ),
                      ),
                      const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 2)),
                    ],
                  ),
                ),
                ListViewer(fisioterapeutas, null, null, null, null, Icons.edit,
                    null, null, chamarTelaEditar),
              ],
            ),
          ),
          const Center(
            child: Text('Formulários'),
          ),
          const Center(
            child: Text('Gráficos'),
          ),
          const Center(
            child: Text('Perfil'),
          ),
        ],
      ),
    );
  }
}
