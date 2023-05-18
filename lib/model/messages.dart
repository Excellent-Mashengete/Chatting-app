// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

@immutable
class Messages {
  const Messages({
    required this.receiver,
    required this.text,
    required this.recipienttype,
    required this.isFile,
    required this.delmessage,
  });
  final String receiver;
  final String text;
  final String recipienttype;
  final String isFile;
  final String delmessage;
}
