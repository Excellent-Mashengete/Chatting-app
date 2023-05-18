class UserData {
  final int? id;
  final String? firstname;
  final String? phone;
  final String? avatar;
  
  UserData({this.id, this.firstname, this.phone, this.avatar});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"] ?? "",
      firstname: json["firstname"] ?? "",
      phone: json["phone"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }
}