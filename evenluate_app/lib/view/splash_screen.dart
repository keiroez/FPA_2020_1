import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evenluate_app/view/login_screen.dart';
import 'dart:async';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
//    SystemChrome.setEnabledSystemUIOverlays([]);
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
                color: Color(0xFF295183),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                        padding: EdgeInsets.all(10),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              child: new Text('EvenLuate',
                                  style: TextStyle(
                                    fontFamily: 'Padrao',
                                    fontSize: 40,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
