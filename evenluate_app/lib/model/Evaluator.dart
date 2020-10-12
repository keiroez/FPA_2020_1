import 'package:evenluate_app/model/Event.dart';
import 'package:evenluate_app/model/User.dart';

class Evaluator {
  int id;
  String name;
  Event event;
  User user;

  Evaluator(this.id, this.name, this.event, this.user);

  factory Evaluator.fromMap(Map json) {
    return Evaluator(json['id'], json['name'], Event.fromMap(json['event']),
        User.fromMap(json['user']));
  }
}
