import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreen createState() => _ProjectScreen();
}

class _ProjectScreen extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black),
        home: Scaffold(

        )
    );
  }
}