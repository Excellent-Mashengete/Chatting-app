// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

@immutable
class MessageData {
  const MessageData({
    required this.id,
    required this.senderName,
    required this.message,
    required this.messageDate,
    required this.phoneNumber,
    required this.profilePicture,
  });
  final String id;
  final String senderName;
  final String message;
  final String messageDate;
  final String phoneNumber;
  final String profilePicture;
}
