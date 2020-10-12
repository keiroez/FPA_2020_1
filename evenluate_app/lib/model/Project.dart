import 'Team.dart';

class Project{
  int id;
  String title;
  String resume;
  Team team;

  Project(this.id, this.title, this.resume, this.team);
  Project.lazy(this.id, this.title, this.resume);

  factory Project.fromMap(Map json) {
    return Project(
      json['id'],
      json['title'],
      json['resume'],
      Team.fromMap(json['team']),
    );
  }

  factory Project.fromMapLazy(Map json) {
    return Project.lazy(
      json['project']['id'],
      json['project']['title'],
      json['project']['resume'],
    );
  }

  static List<Project> toList(List list) {
    return list.map((e) => Project.fromMapLazy(e)).toList();
  }

}