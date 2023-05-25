import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 1)
class CurrentUser extends HiveObject {
  @HiveField(0)
  final String? name;
  
  @HiveField(1)
  final String? email;
  
  @HiveField(2)
  final String? phoneNumber;
    
  @HiveField(3)
  final String? avatar;

  CurrentUser({this.name, this.email, this.phoneNumber, this.avatar});

}
