import 'package:dio/dio.dart';
import 'package:evenluate_app/model/Project.dart';
import 'package:evenluate_app/model/dio/dio_service.dart';
import 'package:evenluate_app/model/utils/constants.dart';
import 'package:evenluate_app/view/evaluation_screen.dart';
import 'package:evenluate_app/view/home_screen.dart';
import 'package:evenluate_app/view/project_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:toast/toast.dart';

class HomeController {
  TextEditingController textEditingController;
  ProgressDialog progressDialog;

  HomeController(TextEditingController textEditingController) {
    this.textEditingController = textEditingController;
  }

  Future<void> lerQrCode(BuildContext context) async {
    String cameraScanResult = await scanner.scan();
    this.textEditingController.text = cameraScanResult;
    irParaProjeto(context);
  }

  irParaProjeto(context) async {
    showProgressDialog(context);
    try {
      Constants.PROJECT =
          await dioProjectById(context, this.textEditingController.text);
      progressDialog.hide();

      Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (BuildContext context) {
            return WillPopScope(
                onWillPop: _onBackPressed,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xFF295183),
                    iconTheme: IconThemeData(color: Colors.white),
                    title: const Text('Voltar',
                        style: TextStyle(color: Colors.white)),
                  ),
                  body: Container(child: EvaluationScreen()),
                ));
          }, // ...to here.
        ),
      );
    } on Exception catch (exception) {
      progressDialog.hide();
      Toast.show("Projeto não encontrado!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }
  }

  Future<bool> _onBackPressed() async {
    return true;
  }

  Future<Project> dioProjectById(BuildContext context, String id) async {
    DioService dioServive = DioService();

    var response = await dioServive.service.get("project/${id}");

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Project.fromMap(response.data);
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
  }
}
