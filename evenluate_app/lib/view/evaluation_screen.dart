import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EvaluationScreen extends StatefulWidget {
  @override
  _EvaluationScreen createState() => _EvaluationScreen();
}

class _EvaluationScreen extends State<EvaluationScreen> {
  int _valueRadioTipoCliente = 0;
  String _optionSelect = 'Novo Cliente';

  Widget build(BuildContext context) {
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
                    height: 80,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Trabalho X',
                          style: TextStyle(
                            fontSize: 25
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Autores: Fulano de tal e Ciclano')
                        ],
                      )
                    ]))),
            Card(
                child: Container(
              height: 200,
              child: ListView(
                children: [
                  Row(
                    children: [Text('Resumo: ')],
                  ),
                  Row(
                    children: [
                      Text(
                          "Aqui irá aparecer o resumo do trabalho que será avaliado...")
                    ],
                  )
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
          _optionSelect = 'Novo Cliente';
          break;
        case 1:
          _optionSelect = 'Migração';
          break;
      }
    });
  }
}
