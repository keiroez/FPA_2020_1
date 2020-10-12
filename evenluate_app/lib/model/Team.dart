import 'package:evenluate_app/model/Event.dart';
import 'package:evenluate_app/model/Member.dart';

class Team{
  int id;
  String name;
  Event event;
  List<Member> members;

  Team(this.id, this.name, this.event, this.members);

  factory Team.fromMap(Map json) {
    return Team(
      json['id'],
      json['name'],
      Event.fromMap(json['event']),
      Member.toList(json['members'])
    );
  }

}