import 'package:hive/hive.dart';

part 'user_modal.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String? name;
  
  @HiveField(2)
  final String? email;
  
  @HiveField(3)
  final String? phoneNumber;
    
  @HiveField(4)
  final String? avatar;

  User({this.name, this.email, this.phoneNumber, this.avatar});

}
