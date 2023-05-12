import 'package:flutter/material.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/service/chats_users_api_service.dart';

class ChatProvider extends ChangeNotifier {
  ChatResponseModel? post;

  bool isApiCallProcessing = false;

  getChats() async {
    isApiCallProcessing = true;
    post = await MessageApiClient().getAllChats();
    isApiCallProcessing = false;

    notifyListeners();
  }
}
