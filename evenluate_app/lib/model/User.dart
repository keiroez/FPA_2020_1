class User{
  int id;
  String first_name;
  String last_name;
  String email;
  String password;

  User(this.id, this.first_name, this.last_name, this.password, this.email);

  factory User.fromMap(Map json) {
    return User(
      json['user']['id'],
      json['user']['first_name'],
      json['user']['last_name'],
      json['user']['password'],
      json['user']['email'],
    );
  }


  Map<String, dynamic> toJson() => {
    "first_name": first_name,
    "last_name": last_name,
    "username": email,
    "password": password,
  };

}