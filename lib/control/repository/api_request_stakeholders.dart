import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:oncolo/control/controller_stakeholders.dart';
import 'package:oncolo/model/pacientes/pacientes.dart';
import 'package:oncolo/model/fisioterapeutas/fisioterapeutas.dart';
import 'package:oncolo/model/admin/admin.dart';
import 'package:oncolo/view/resources/snacks.dart';

class APICallsStakeholders {
  //Fisioterapeuta? fisio;
  Administrador? adm;

  Future<int> cadastrarInstituicao(
      {required String nomeFantasia,
      required String cnpj,
      required String email,
      int? id,
      required String senha,
      required BuildContext context}) async {
    final baseUrl =
        Uri.parse('https://web-production-6c4b5.up.railway.app/instituicao/');
    final response = await http.post(baseUrl,
        body: jsonEncode({
          //'id': id,
          'nome': nomeFantasia,
          'cnpj': cnpj,
          'email': email,
          'senha': senha,
        }),
        headers: {'Content-Type': 'application/json'});

    debugPrint(response.body.toString());
    debugPrint(response.statusCode.toString());

    SnackMessage().showMessage(response.statusCode);
    return response.statusCode;
  }

  Future<int> cadastrarFisioterapeuta(
      {required String nome,
      required String matricula,
      required String email,
      required int? instituicao,
      required String senha,
      required BuildContext context}) async {
    final baseUrl = Uri.parse(
        'https://web-production-6c4b5.up.railway.app/fisioterapeuta/');
    final response = await http.post(baseUrl,
        body: jsonEncode({
          //'id': id,
          'nome': nome,
          'matricula': matricula,
          'email': email,
          'senha': senha,
          'instituicao': instituicao,
        }),
        headers: {'Content-Type': 'application/json'});

    debugPrint(response.body.toString());
    debugPrint(response.statusCode.toString());

    SnackMessage().showMessage(response.statusCode);
    return response.statusCode;
  }

  Future<int> cadastrarPaciente(
      {required String nome,
      required String cpf,
      required String telefone,
      required String dataNascimento,
      required String matricula,
      required double altura,
      required double peso,
      required String email,
      int? id,
      required String senha,
      required BuildContext context}) async {
    final baseUrl =
        Uri.parse('https://web-production-6c4b5.up.railway.app/paciente/');
    final response = await http.post(baseUrl,
        body: jsonEncode({
          'nome': nome,
          'cpf': cpf,
          'telefone': telefone,
          'data_nascimento': dataNascimento,
          'altura': altura,
          'peso': peso,
          'matricula': matricula,
        }),
        headers: {'Content-Type': 'application/json'});

    return response.statusCode;
  }

  Future<void> listarInstituicoes() async {
    final baseUrl =
        Uri.parse('https://web-production-6c4b5.up.railway.app/instituicao/');

    final response = await http.get(baseUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
  }

  Future<List<Fisioterapeuta>> listarFisioterapeutas() async {
    final baseUrl = Uri.parse(
        'https://web-production-6c4b5.up.railway.app/fisioterapeuta/');
    List<Fisioterapeuta> fisioterapeutas = [];

    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      var fisioterapeutasRetornados =
          (jsonDecode(response.body) as Map<String, dynamic>)
              .entries
              .elementAt(3)
              .value;

      fisioterapeutasRetornados.forEach((paciente) {
        var novoPaciente = Fisioterapeuta.fromJson(paciente);

        fisioterapeutas.add(novoPaciente);
      });

      return fisioterapeutas;
    } else {
      throw Exception('Falha ao carregar fisioterapeutas');
    }
  }

  Future<List<Pacientes>> listarPacientes() async {
    final baseUrl =
        Uri.parse('https://web-production-6c4b5.up.railway.app/paciente/');
    List<Pacientes> pacientes = [];

    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      var pacientesRetornados =
          (jsonDecode(response.body) as Map<String, dynamic>)
              .entries
              .elementAt(3)
              .value;

      pacientesRetornados.forEach((paciente) {
        var novoPaciente = Pacientes.fromJson(paciente);

        pacientes.add(novoPaciente);
      });

      return pacientes;
    } else {
      throw Exception('Falha ao carregar pacientes');
    }
  }

  Future<int> editarFisioterapeuta(
      {required String nome,
      required String matricula,
      required String email,
      required String instituicao,
      required String senha,
      required int id,
      required BuildContext context}) async {
    final baseUrl = Uri.parse(
        'https://web-production-6c4b5.up.railway.app/fisioterapeuta/$id');

    final response = await http.put(baseUrl,
        body: jsonEncode({
          //'id': id,
          'nome': nome,
          'matricula': matricula,
          'email': email,
          'senha': senha,
          'instituicao': instituicao,
        }),
        headers: {'Content-Type': 'application/json'});

    return response.statusCode;
  }
}
