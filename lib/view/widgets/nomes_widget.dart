import 'package:flutter/material.dart';

class NomesWidget extends StatefulWidget {
  const NomesWidget({super.key});

  @override
  _NomesWidgetState createState() => _NomesWidgetState();
}

class _NomesWidgetState extends State<NomesWidget> {
  List<String> nomes = [];

  Future<void> buscarNomes() async {
    //TODO: implementar chamada da API para buscar nomes
    List<String> nomesDaApi = ['João', 'Maria', 'Pedro', 'Ana'];
    setState(() {
      nomes = nomesDaApi;
    });
  }

  @override
  void initState() {
    super.initState();
    buscarNomes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: nomes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(nomes[index]),
          );
        },
      ),
    );
  }
}
