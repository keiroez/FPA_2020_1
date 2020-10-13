import 'package:evenluate_app/model/Project.dart';
import 'package:evenluate_app/model/dio/dio_service.dart';
import 'package:evenluate_app/model/utils/constants.dart';
import 'package:flutter/material.dart';

class ProjectController {
  Future<List<Project>> dioListarProjetos(BuildContext context) async {
    DioService dioServive = DioService();

    var response = await dioServive.service
        .get("evalproject/user/${Constants.USER.id}/list");

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Project.toList(response.data);
    }
  }
}
