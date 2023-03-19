import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oncolo/view/pages/web/tela_login_web.dart';
import 'package:oncolo/view/pages/mobile/tela_login_mobile.dart';
import 'package:oncolo/view/widgets/oncolo.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnColoBrand(
        element: const LoginPage(),
      ),
    );
  }
}
