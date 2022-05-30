class User {
  String? username;
  String? email;
  String? password;
  bool? isAdmin;
  String? token;

  User({
    this.token,
    this.username,
    this.email,
    this.password,
    this.isAdmin,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "username": username,
      "email": email,
      "password": password,
      "token": token,
      "isAdmin": isAdmin,
      "accessToken": token,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
