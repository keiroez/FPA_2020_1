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
  int _valueRadioTipoCliente = 0;
  String _optionSelect = 'Nota';

  Widget build(BuildContext context) {
    EvaluationController evaluationController = EvaluationController();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.black,
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
                            Text(Constants.PROJECT.title,
                                style: TextStyle(fontSize: 20)),
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
                                textAlign: TextAlign.left),
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
                      Text(
                        'Resumo: ',
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      Constants.PROJECT.resume,
                      textAlign: TextAlign.justify,
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
                    Text('Selecione abaixo a nota para este trabalho: ')
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
                  maxLines: 10,
                  decoration: InputDecoration.collapsed(
                      hintText: "Comentários e sugestões"),
                ),
              ),
            )
          ],
        ));
  }

  Future<bool> _onBackPressed() async {
    return true;
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
        case 0:
          _optionSelect = '1';
          break;
        case 1:
          _optionSelect = '2';
          break;
        case 2:
          _optionSelect = '3';
          break;
        case 3:
          _optionSelect = '4';
          break;
        case 4:
          _optionSelect = '5';
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
}
