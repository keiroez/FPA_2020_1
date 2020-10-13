class Evaluator {
  int id;
  String name;

  Evaluator(this.id, this.name);

  factory Evaluator.fromMap(Map json) {
    return Evaluator(json['id'], json['name']);
  }
}
