import 'package:flutter/material.dart';
import 'package:oncolo/model/pacientes/pacientes.dart';
import 'package:oncolo/view/widgets/listViewer.dart';
import 'package:oncolo/model/pacientes/paciente_type.dart';

import '../../../control/repository/api_request_stakeholders.dart';

/// Classe de listagem de pacientes.
class TelaListarPacienteWeb extends StatefulWidget {
  const TelaListarPacienteWeb({super.key});

  @override
  State<TelaListarPacienteWeb> createState() => _TelaListarPacienteWeb();
}

class _TelaListarPacienteWeb extends State<TelaListarPacienteWeb>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Future<List<Pacientes>> pacientes;

  /// Função para chamar tela de edição de pacientes.
  chamarTelaEditar() {
    Navigator.of(context).pushNamed('/editarFisio');
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    pacientes = APICallsStakeholders().listarPacientes();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// Lista de pacientes para testes e exibição na tela.

  /// Construção do Design da tela de listagem de pacientes.
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
                          'Pacientes',
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
                                  '/cadastrarFisio'); // função para executar quando o botão de enviar for pressionado
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
                ListViewer(null, pacientes, null, Icons.description,
                    Icons.bar_chart, Icons.edit, null, null, chamarTelaEditar),
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
