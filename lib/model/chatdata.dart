// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

@immutable
class MessageData {
  const MessageData({
    this.id,
    this.senderName,
    this.message,
    this.messageDate,
    this.phoneNumber,
    this.profilePicture,
  });
  final int? id;
  final String? senderName;
  final String? message;
  final DateTime? messageDate;
  final String? phoneNumber;
  final String? profilePicture;
}
