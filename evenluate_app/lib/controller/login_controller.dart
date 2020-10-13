import 'package:dio/dio.dart';
import 'package:evenluate_app/model/Evaluator.dart';
import 'package:evenluate_app/model/User.dart';
import 'package:evenluate_app/model/dio/dio_service.dart';
import 'package:evenluate_app/model/utils/constants.dart';
import 'package:evenluate_app/view/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

class LoginController {
  String login = null;
  String psw = null;
  User user = null;
  ProgressDialog progressDialog;

  Future<User> _dioLogin(String username, String password) async {
    Dio dio = Dio();
    var response = await dio.post(Constants.LOGIN_URL,
        data: {'username': username, 'password': password});

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      Constants.USER_TOKEN = response.data['token'];
      print(Constants.USER_TOKEN);
      Constants.EVALUATOR = Evaluator.fromMap(response.data['evaluator']);
      print(Constants.EVALUATOR);
      return User.fromMap(response.data);
    }
  }

  _dioEvaluator(String id) async {
    DioService dio = DioService();
    var response = await dio.service.get('evaluator/byuser/${id}');
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      Constants.EVALUATOR = Evaluator.fromMap(response.data);
    }
  }

  goToPassword(BuildContext context, String textHint, String loginSenha) {
    _pressLogin(textHint, context, loginSenha);
  }

  void _pressLogin(textHint, context, String loginSenha) async {
    if (textHint == "user") {
      this.login = loginSenha;
      Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (BuildContext context) {
            return WillPopScope(
                onWillPop: _onBackPressed,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.black),
                    title: const Text('Voltar para login',
                        style: TextStyle(color: Colors.black)),
                  ),
                  body: Container(child: loginWdgt('senha', context)),
                ));
          }, // ...to here.
        ),
      );
    } else {
      this.psw = loginSenha;
      showProgressDialog(context);
      try {
        this.user = await _dioLogin(this.login, this.psw);
        print(user.id);
        Constants.USER = this.user;

        progressDialog.hide();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MenuScreen()));
      } on Exception catch (exception) {
        progressDialog.hide();
        Toast.show("Login ou senha incorretos", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }
  }

  Future<bool> _onBackPressed() async {
    return true;
  }

  ListView loginWdgt(textHint, context) {
    TextEditingController lsController = new TextEditingController();

    ListView lsv = ListView(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 100, left: 100, right: 100, bottom: 20),
        child: Container(
            width: 100,
            height: 180,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage('assets/images/logo2.png'),
                ))),
      ),
      textHint == "senha"
          ? Padding(
              padding: EdgeInsets.only(left: 100, right: 70, bottom: 10),
              child: Text("${this.login}, digite sua senha abaixo: "),
            )
          : Container(),
      Padding(
        padding: EdgeInsets.only(left: 70, right: 70),
        child: TextField(
          obscureText: fields(textHint),
          controller: lsController,
          textAlign: TextAlign.center,
          decoration: new InputDecoration(
            hintText: textHint,
            enabledBorder: const OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: const BorderSide(color: Colors.black, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.indigo,
              ),
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 100, right: 100, top: 20),
        child: FlatButton(
          shape: new CircleBorder(),
          child: Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.navigate_next,
                color: Colors.white,
                size: 50.0,
                semanticLabel: 'Text to announce in accessibility modes',
              )),
          color: Colors.black,
          onPressed: () {
            if (lsController.text.length > 0) {
              this.goToPassword(context, textHint, lsController.text);
            } else {
              Toast.show("Digite o seu usuário!", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            }
          },
        ),
      )
    ]);
    return lsv;
  }

  bool fields(textHint) {
    if (textHint == "senha") {
      return true;
    } else {
      return false;
    }
  }

  showProgressDialog(BuildContext context) {
    if (progressDialog == null) {
      progressDialog = ProgressDialog(context, showLogs: true);
      progressDialog.style(
        message: " Aguarde...",
        messageTextStyle: TextStyle(
            color: Colors.black45, fontSize: 14, fontWeight: FontWeight.normal),
        progressWidget: Padding(
          padding: EdgeInsets.all(12.0),
          child: CircularProgressIndicator(),
        ),
        elevation: 20.0,
      );
    }
    progressDialog.show();
  }
}
