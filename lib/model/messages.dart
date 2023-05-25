// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

@immutable
class Messages {
  const Messages({
    this.receiver,
    this.text,
    this.recipienttype,
    this.isFile,
    this.delmessage,
  });
  final String? receiver;
  final String? text;
  final String? recipienttype;
  final String? isFile;
  final String? delmessage;
}
