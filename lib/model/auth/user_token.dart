import 'package:hive/hive.dart';

part 'user_token.g.dart';

@HiveType(typeId: 2)
class Token extends HiveObject {
  @HiveField(0)
  final String? token;
  
  Token({this.token});
}
