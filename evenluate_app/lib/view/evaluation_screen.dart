import 'dart:async';

import 'package:evenluate_app/controller/evaluation_controller.dart';
import 'package:evenluate_app/model/Member.dart';
import 'package:evenluate_app/model/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EvaluationScreen extends StatefulWidget {
  @override
  _EvaluationScreen createState() => _EvaluationScreen();
}

class _EvaluationScreen extends State<EvaluationScreen> {
  int _valueRadioTipoCliente = -1;
  String _optionSelect = 'nota';
  TextEditingController commentsController = new TextEditingController();
  EvaluationController evaluationController;

  Widget build(BuildContext context) {
    evaluationController = EvaluationController(commentsController);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _handleCapturarTextoRadioTipoCliente(_valueRadioTipoCliente);
            if (!evaluationController.save(context)) {
              lazyClose();
            }
            // Add your onPressed code here!
          },
          child: Icon(Icons.save),
          backgroundColor: Color(0xFF295183),
        ),
        body: ListView(
          children: [
            Card(
                child: Container(
                    height: 100,
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(Constants.PROJECT.title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54)),
                            )
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            child: ListView(
                              children: [
                                Text(
                                  'Autores: ' +
                                      autores(Constants.PROJECT.team.members),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ))
                      ],
                    ))),
            Card(
                child: Container(
              height: 200,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Resumo: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      Constants.PROJECT.resume,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            )),
            Card(
                child: Container(
              height: 115,
              padding: EdgeInsets.only(bottom: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selecione abaixo a nota para este trabalho:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    )
                  ],
                ),
                Row(
                  children: [
                    notas(1),
                    notas(2),
                    notas(3),
                    notas(4),
                    notas(5),
                  ],
                ),
              ]),
            )),
            Card(
              child: Container(
                height: 200,
                child: TextFormField(
                  controller: commentsController,
                  maxLines: 10,
                  decoration: InputDecoration.collapsed(
                      hintText: "Comentários e sugestões"),
                ),
              ),
            )
          ],
        ));
  }

  Column notas(int value) {
    return Column(
      children: [
        Row(
          children: [
            Row(children: [
              Container(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Text(value.toString()))
            ]),
          ],
        ),
        Row(
          children: [
            Row(children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: new Radio(
                  value: value,
                  groupValue: _valueRadioTipoCliente,
                  onChanged: _handleCapturarTextoRadioTipoCliente,
                ),
              )
            ]),
          ],
        ),
      ],
    );
  }

  void _handleCapturarTextoRadioTipoCliente(int value) {
    setState(() {
      _valueRadioTipoCliente = value;

      switch (_valueRadioTipoCliente) {
        case 1:
          _optionSelect = '1';
          evaluationController.optionSelect = 1;
          break;
        case 2:
          _optionSelect = '2';
          evaluationController.optionSelect = 2;
          break;
        case 3:
          _optionSelect = '3';
          evaluationController.optionSelect = 3;
          break;
        case 4:
          _optionSelect = '4';
          evaluationController.optionSelect = 4;
          break;
        case 5:
          _optionSelect = '5';
          evaluationController.optionSelect = 5;
          break;
      }
    });
  }

  String autores(List<Member> list) {
    var concatenate = StringBuffer();

    list.forEach((item) {
      concatenate.write(item.name + " ");
    });

    return concatenate.toString();
  }

  Future<Timer> lazyClose() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pop(context);
  }
}
