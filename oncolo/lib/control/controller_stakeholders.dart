import 'package:flutter/material.dart';
import 'package:oncolo/control/repository/api_request_stakeholders.dart';
import 'package:oncolo/model/fisioterapeutas/fisioterapeutas.dart';
import 'package:oncolo/model/pacientes/pacientes.dart';
import 'package:oncolo/view/resources/snacks.dart';
import 'package:oncolo/view/resources/snacks_1.dart';

class ControllerStakeHolders extends ChangeNotifier {
  TextEditingController nomeFantasia = TextEditingController();
  TextEditingController cnpj = TextEditingController();

  //Fisioterapeutas e Pacientes
  TextEditingController nome = TextEditingController();
  TextEditingController matricula = TextEditingController();
  TextEditingController instituicao = TextEditingController();

  //Paciente
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  TextEditingController imc = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  //Usuario
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  Fisioterapeuta? fisio;
  Pacientes? paciente;

  bool loading = false;
  bool update = false;
  int id = 0;

  APICallsStakeholders api = APICallsStakeholders();

  Future<int> cadastrarInstituicao(
      {required BuildContext context,
      required GlobalKey<FormState> formKey}) async {
    int code = 400;
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      changedLoad(true);

      code = await api.cadastrarInstituicao(
          nomeFantasia: nomeFantasia.text,
          cnpj: cnpj.text,
          email: email.text,
          senha: senha.text,
          context: context);

      SnackMessage().showMessage(code);
    }
    if (code == 201 || code == 200) {
      ScaffoldMessenger.of(context).showSnackBar(Snacks.sucessoCadastro);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(Snacks.erroCadastro);
    }

    notifyListeners();
    return code;
  }

  Future<int> cadastrarFisioterapeuta(
      {required BuildContext context,
      required GlobalKey<FormState> formKey}) async {
    int code = 400;
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      changedLoad(true);
      //sobrenome = nome.text.split(' ').last;

      code = await api.cadastrarFisioterapeuta(
          nome: nome.text,
          matricula: matricula.text,
          email: email.text,
          senha: senha.text,
          instituicao: null,
          context: context);
    }

    if (code == 201 || code == 200) {
      ScaffoldMessenger.of(context).showSnackBar(Snacks.sucessoCadastro);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(Snacks.erroCadastro);
    }
    notifyListeners();
    return code;
  }

  Future<int> cadastrarPaciente(
      {required BuildContext context,
      required GlobalKey<FormState> formKey}) async {
    int code = 400;
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      changedLoad(true);

      code = await api.cadastrarPaciente(
          nome: nome.text,
          matricula: matricula.text,
          cpf: cpf.text,
          telefone: telefone.text,
          dataNascimento: dataNascimento.text,
          altura: double.parse(altura.text),
          peso: double.parse(peso.text),
          email: email.text,
          senha: senha.text,
          context: context);

      print(code);
    }

    notifyListeners();
    //SnackMessage().showMessage(code);
    if (code == 201 || code == 200) {
      ScaffoldMessenger.of(context).showSnackBar(Snacks.sucessoCadastro);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(Snacks.erroCadastro);
    }
    return code;
  }

  Future<List<Fisioterapeuta>> listarFisioterapeuta(
      {required BuildContext context}) async {
    List<Fisioterapeuta> fisios = await api.listarFisioterapeutas();

    //ScaffoldMessenger.of(context).showSnackBar(Snacks.sucessoCadastro);
    return fisios;
  }

  Future<void> editarFisioterapeuta(
      BuildContext context, GlobalKey globalKey) async {
    int code;

    code = await api.editarFisioterapeuta(
        nome: nome.text,
        matricula: matricula.text,
        email: email.text,
        instituicao: instituicao.text,
        senha: senha.text,
        id: id,
        context: context);

    if (code == 201 || code == 200) {
      ScaffoldMessenger.of(context).showSnackBar(Snacks.sucessoEdicao);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(Snacks.erroCadastro);
    }
  }

  Fisioterapeuta? receberEditarFisio(Fisioterapeuta? fisio) {
    this.fisio = fisio;

    notifyListeners();
    return this.fisio;
  }

  Pacientes? receberEditarPaciente(Pacientes? paciente) {
    this.paciente = paciente;
    notifyListeners();
    return paciente;
  }

  void changedLoad(bool loading) {
    this.loading = loading;
    notifyListeners();
  }
}
