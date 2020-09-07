import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evenluate_app/view/menu_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black),
        home: Scaffold(
//            appBar: AppBar(
//              title: Text("Login"),
//            ),
            body: Container(
              child: lsv("Usuário"),
              color: Colors.white,
            )));
  }

  void _pressLogin(textHint) {
    if (textHint == "Usuário") {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
//              appBar: AppBar(
//                backgroundColor: Colors.black,
//                title: Text("Senha"),
//              ),
              body: Container(child: lsv('Senha')),
            );
          }, // ...to here.
        ),
      );
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuScreen()));
    }
  }

  ListView lsv(textHint) {
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
                  image: new AssetImage('assets/images/logo3.jpg'),
                ))),
      ),
      Padding(
        padding: EdgeInsets.only(left: 70, right: 70),
        child: TextField(
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
            _pressLogin(textHint);
          },
        ),
      )
    ]);
    return lsv;
  }
}
