import 'package:evenluate_app/model/Evaluator.dart';
import 'package:evenluate_app/model/EvaluatorProject.dart';
import 'package:evenluate_app/model/dio/dio_service.dart';
import 'package:evenluate_app/model/utils/constants.dart';

class EvaluationController {


  Future<bool> dioProjectById() async {
    DioService dioServive = DioService();
    EvaluatorProject evaluatorProject = EvaluatorProject.lazy(Constants.PROJECT, Constants.EVALUATOR, 5.0, "dadadada");

    var response = await dioServive.service.post("evalproject/create", data: evaluatorProject.toJson());

    if (response.statusCode != 200) {
      throw Exception();
    } else {

    }
  }
}
