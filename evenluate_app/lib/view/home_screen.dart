import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Container(child: lsv("Usuário")),
        ));
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(

        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Senha"),
            ),
            body: Container(child: lsv('Senha')),
          );
        }, // ...to here.
      ),
    );
  }

  ListView lsv(textHint) {
    ListView lsv = ListView(children: <Widget>[
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 200),
        child: Text(''),
      ),
      Padding(
        padding: EdgeInsets.only(left: 70, top: 20, right: 70),
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
        padding: EdgeInsets.only(left: 150, right: 150),
        child: FlatButton(
            child: Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            color: Colors.black,
            onPressed: () {
              _pushSaved();
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0))),
      )
    ]);
    return lsv;
  }
}
