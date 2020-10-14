import 'package:evenluate_app/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evenluate_app/view/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  TextEditingController codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController(codeController);

    return ListView(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 100, left: 100, right: 100, bottom: 20),
        child: Container(
            child: Center(
                child: InkWell(
                    onTap: () => {homeController.lerQrCode(context)},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                              size: 80,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ler QRCode',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      ],
                    ))),
            width: 100,
            height: 180,
            decoration: BoxDecoration(
              color: Color(0xFF295183),
              shape: BoxShape.circle,
            )),
      ),
      Padding(
        padding: EdgeInsets.only(left: 70, right: 70),
        child: TextField(
          controller: codeController,
          textAlign: TextAlign.center,
          decoration: new InputDecoration(
            hintText: 'Código do projeto',
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
          color: Color(0xFF295183),
          onPressed: () {
            homeController.irParaProjeto(context);
          },
        ),
      )
    ]);
  }

  void _insertQrcode() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MenuScreen()));
  }
}
