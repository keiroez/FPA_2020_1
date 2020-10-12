import 'package:evenluate_app/model/Evaluator.dart';
import 'package:evenluate_app/model/Project.dart';

class EvaluatorProject {
  int id;
  Project project;
  Evaluator evaluator;
  double value;
  String comments;

  EvaluatorProject(
      this.id, this.project, this.evaluator, this.value, this.comments);

  EvaluatorProject.lazy(this.project, this.evaluator, this.value, this.comments);

  factory EvaluatorProject.fromMap(Map json) {
    return EvaluatorProject(json['id'], Project.fromMap(json['project']),
        Evaluator.fromMap(json['evaluator']), json['value'], json['comments']);
  }

  Map<String, dynamic> toJson() => {
    "project": project.id,
    "evaluator": evaluator.id,
    "value": value,
    "comments": comments,
  };
}
