// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:oncolo/model/fisioterapeutas/fisio_type.dart';
import 'package:oncolo/model/fisioterapeutas/fisioterapeutas.dart';
import 'package:oncolo/model/pacientes/paciente_type.dart';
import 'package:oncolo/model/formularios/form_type.dart';
import 'package:oncolo/model/pacientes/pacientes.dart';
import 'package:oncolo/view/pages/mobile/tela_editar_paciente_mobile.dart';

import '../../control/controller_stakeholders.dart';
import '../../model/fisioterapeutas/fisioterapeutas.dart';
import '../pages/mobile/tela_editar_fisio_mobile.dart';

class ListViewer extends StatefulWidget {
  ListViewer(
      this.fisio,
      this.patients,
      this.forms,
      this.firstIcon,
      this.secondIcon,
      this.thirdIcon,
      this.firstIconTap,
      this.secondIconTap,
      this.thirdIconTap,
      {super.key});

  Future<List<Pacientes>>? patients;
  List<FormType>? forms;
  Future<List<Fisioterapeuta>>? fisio;
  IconData? firstIcon;
  IconData? secondIcon;
  IconData thirdIcon;
  Function? firstIconTap;
  Function? secondIconTap;
  Function? thirdIconTap;

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  ControllerStakeHolders _controller = ControllerStakeHolders();
  var eFisio = false;

  // validacao() async {
  //   List<Fisioterapeuta> fisio =
  //       await _controller.listarFisioterapeuta(context: context);

  //   if (fisio.isNotEmpty) {
  //     return fisio;
  //   } else {
  //     return 'Não há Fisioterapeuta cadastrado. Ou houve erro na sua requisição';
  //   }
  // }

  navEditarPaciente(Pacientes paciente) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaEditarPaciente(paciente: paciente)));
  }

  navEditarFisio(Fisioterapeuta fisio) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TelaEditarFisioterapeuta(fisioterapeuta: fisio)));
  }

  @override
  Widget build(BuildContext context) {
    verificaEFisio() {
      eFisio = widget.fisio != null;
    }

    return Expanded(
        child: Column(
      children: [
        Expanded(
          child: FutureBuilder<dynamic>(
            future: widget.patients ?? widget.fisio,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      String itemTitle = '';
                      String itemSubtitle = '';

                      if (snapshot.data != null && widget.patients != null) {
                        itemTitle = snapshot.data![index].nome;
                        itemSubtitle = snapshot.data![index].matricula;
                      }
                      if (snapshot.data != null && widget.fisio != null) {
                        itemTitle = snapshot.data![index].nome;
                        itemSubtitle = snapshot.data![index].matricula;
                      }
                      if (snapshot.data != null && widget.forms != null) {
                        itemTitle = snapshot.data![index].title;
                      }

                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 165, 162, 162)),
                              ),
                            ),
                            child: Row(children: [
                              Expanded(
                                  flex: 3,
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(itemTitle))),
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(itemSubtitle),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TapRegion(
                                              onTapInside: (event) {
                                                if (widget.firstIconTap !=
                                                    null) {
                                                  widget.firstIconTap!();
                                                }
                                              },
                                              child: Icon(
                                                widget.firstIcon,
                                                color: widget.firstIcon != null
                                                    ? Colors.purple
                                                    : Colors.transparent,
                                              )),
                                          TapRegion(
                                              onTapInside: (event) {
                                                if (widget.secondIconTap !=
                                                    null) {
                                                  widget.secondIconTap!();
                                                }
                                              },
                                              child: Icon(
                                                widget.secondIcon,
                                                color: widget.firstIcon != null
                                                    ? Colors.purple
                                                    : Colors.transparent,
                                              )),
                                          TapRegion(
                                              onTapInside: (event) {
                                                if (eFisio) {
                                                  navEditarFisio(
                                                      snapshot.data![index]);
                                                } else {
                                                  navEditarPaciente(
                                                      snapshot.data![index]);
                                                }
                                              },
                                              child: Icon(
                                                widget.thirdIcon,
                                                color: Colors.purple,
                                              ))
                                        ]),
                                  ))
                            ]),
                          ));
                    });
              } else if (snapshot.hasError) {
                return const Text('Nenhum cadastro');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    ));
  }
}
