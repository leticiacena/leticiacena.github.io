import 'package:flutter/material.dart';

class SnackMessage {
  static String erroPorCodigo(int codigo) {
    String erro = '';

    switch (codigo) {
      case 104:
        erro = 'O CPF deve ter 11 digitos';
        break;
      case 105:
        erro = 'CPF inválido';
        break;
      case 106:
        erro = 'O CNPJ deve ter 14 digitos';
        break;
      case 107:
        erro = 'CNPJ inválido';
        break;
      case 108:
        erro = 'A matricula deve ter 6 digitos';
        break;
      case 109:
        erro = 'Nao inclua numeros neste campo';
        break;
      case 110:
        erro = 'Data de retorno não pode ser anterior a data atual';
        break;
      case 111:
        erro = 'Data de nascimento apos data atual';
        break;
      case 200:
        erro = 'Sucesso';
        break;
      default:
        erro = 'Erro interno do servidor';
        break;
    }

    return erro;
  }

  SnackBar showMessage(int codigo) => SnackBar(
        content: Text(erroPorCodigo(codigo)),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some codigo to undo the change.
          },
        ),
      );

  respostaRequisicao(BuildContext context, int codigo) {
    ScaffoldMessenger.of(context).showSnackBar(showMessage(codigo));
  }
}
