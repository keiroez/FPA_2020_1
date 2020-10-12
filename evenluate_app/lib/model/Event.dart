class Event{
  int id;
  String name;


  Event(this.id, this.name);

  factory Event.fromMap(Map json) {
    return Event(
      json['id'],
      json['name']
    );
  }


  Map<String, dynamic> toJson() => {
    "name": name,
  };

}