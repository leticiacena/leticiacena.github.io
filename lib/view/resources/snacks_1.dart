import 'package:flutter/material.dart';

class Snacks {
  static SnackBar sucessoCadastro = SnackBar(
    content: const Text('Cadastro realizado com sucesso'),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  static SnackBar sucessoEdicao = SnackBar(
    content: const Text('Dados atualizados com sucesso!'),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  static SnackBar erroCadastro = SnackBar(
    content: const Text('Ocorreu um erro durante o cadastro'),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}
