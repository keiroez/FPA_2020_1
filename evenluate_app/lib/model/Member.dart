class Member{
  int id;
  String name;
  String email;

  Member(this.id, this.name, this.email);

  factory Member.fromMap(Map json) {
    return Member(
      json['id'],
      json['name'],
      json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };

  static List<Member> toList(List list) {
    return list.map((e) => Member.fromMap(e)).toList();
  }

}