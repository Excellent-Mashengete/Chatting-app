import 'package:hive/hive.dart';

part 'user_modal.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String? firstname;

  @HiveField(1)
  final String? lastname;
  
  @HiveField(2)
  final String? email;
  
  @HiveField(3)
  final String? phoneNumber;
  
  @HiveField(4)
  final String? token;
  
  @HiveField(5)
  final String? avatar;

  User({this.firstname, this.lastname, this.email, this.phoneNumber, this.token, this.avatar});

}
