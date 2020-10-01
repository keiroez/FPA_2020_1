import 'package:dio/dio.dart';
import 'package:evenluate_app/model/user.dart';
import 'package:evenluate_app/model/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginController {
  String login = null;
  String psw = null;
  User user = null;

  Future<User> _dioLogin(String username, String password) async {
    Dio dio = Dio();
    var response = await dio.post(Constants.LOGIN_URL,
        data: {'username': username, 'password': password});

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      Constants.USER_TOKEN = response.data['token'];
      print(Constants.USER_TOKEN);
      return User.fromMap(response.data);
    }
  }

  goToPassword(BuildContext context, String textHint, String loginSenha) {
    _pressLogin(textHint, context, loginSenha);
  }

  void _pressLogin(textHint, context, String loginSenha) {
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
                  body: Container(child: loginWdgt('psw', context)),
                ));
          }, // ...to here.
        ),
      );
    } else {
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => MenuScreen()));
      this.psw = loginSenha;
      print('login: ' + login + ' senha: ' + psw);
      _dioLogin(this.login, this.psw);
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
            border: const OutlineInputBorder(),
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
//            _pressLogin(textHint);
            this.goToPassword(context, textHint, lsController.text);
          },
        ),
      )
    ]);
    return lsv;
  }

  bool fields(textHint) {
    if (textHint == "psw") {
      return true;
    } else {
      return false;
    }
  }

}
