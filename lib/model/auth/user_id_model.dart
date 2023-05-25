import 'package:hive/hive.dart';

part 'user_id_model.g.dart';

@HiveType(typeId: 3)
class UserId extends HiveObject {
  @HiveField(0)
  final String? uid;
  
  UserId({this.uid});
}
