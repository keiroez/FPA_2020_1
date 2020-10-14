import 'package:evenluate_app/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evenluate_app/view/menu_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen(new LoginController());
}

class _LoginScreen extends State<LoginScreen> {
  final LoginController loginController;

  _LoginScreen(this.loginController);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF295183),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Insira seu usuário"),
            ),
            body: Container(
              child: loginController.loginWdgt("usuario", context),
              color: Colors.white,
            )));
  }
}
