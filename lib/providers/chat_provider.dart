import 'package:flutter/material.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/chats_users_api_service.dart';

class ChatProvider extends ChangeNotifier {
  ChatResponseModel? _chats;

  bool _loading = false;

  bool get loading => _loading;

  Future<void> getChats() async {
    _loading = true;
    notifyListeners();

    _chats = await MessageApiClient().getAllChats();

    _loading = false;
    notifyListeners();
  }
}
