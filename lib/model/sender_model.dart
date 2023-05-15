class User {
  final int? id;
  final String? firstname;
  final String? phone;
  final String? avatar;
  
  User({this.id, this.firstname, this.phone, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? "",
      firstname: json["firstname"] ?? "",
      phone: json["phone"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }
}