import 'package:evenluate_app/model/Evaluator.dart';
import 'package:evenluate_app/model/EvaluatorProject.dart';
import 'package:evenluate_app/model/dio/dio_service.dart';
import 'package:evenluate_app/model/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class EvaluationController {
  double optionSelect;
  TextEditingController commentsController;

  EvaluationController(TextEditingController commentsController) {
    this.optionSelect = -1;
    this.commentsController = commentsController;
  }

  save(BuildContext context) {
    if (this.optionSelect == -1) {
      Toast.show("Insira a nota", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      return true;
    }
    if (this.commentsController.text == '') {
      Toast.show("Insira algum comentário ou sugestão", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      return true;
    }

    _dioEvaluatorProject(context);
    return false;
  }

  _dioEvaluatorProject(BuildContext context) async {
    DioService dioServive = DioService();
    EvaluatorProject evaluatorProject = EvaluatorProject.lazy(Constants.PROJECT,
        Constants.EVALUATOR, this.optionSelect, commentsController.text);

    print(evaluatorProject.toJson());
    try {
      var response = await dioServive.service
          .post("evalproject/create", data: evaluatorProject.toJson());

      if (response.statusCode != 201) {
        Toast.show("Erro ao avaliar, tente novamente!", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      } else {
        Toast.show("Projeto avaliado", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
      }
    } on Exception catch (_) {
      Toast.show("Projeto já avaliado por você", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }
  }
}
