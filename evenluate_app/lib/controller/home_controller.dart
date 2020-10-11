import 'package:evenluate_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeController {
  TextEditingController textEditingController;

  HomeController(TextEditingController textEditingController) {
    this.textEditingController = textEditingController;
  }

  Future<void> lerQrCode() async {
    String cameraScanResult = await scanner.scan();
    this.textEditingController.text = cameraScanResult;
  }
}
