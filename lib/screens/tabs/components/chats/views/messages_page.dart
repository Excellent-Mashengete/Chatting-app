import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Messages extends StatefulWidget {
  const Messages({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late MessageData messageData;

  @override
  void initState() {
    super.initState();
    messageData = widget.messageData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            backgroundColor: ThemeConstants.dark2Color,
            leadingWidth: 30,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.network(
                    messageData.profilePicture,
                    height: 45,
                    width: 45,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(messageData.senderName),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: IconBorder(
                    icon: CupertinoIcons.video_camera_solid,
                    size: 25,
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Center(
                  child: IconBorder(
                    icon: CupertinoIcons.phone_fill,
                    size: 25,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
        children: [
          for (int i = 0; i < 5; i++) const ChatSample(),
        ],
      ),
      bottomSheet: const ChatBottomBar(),
    );
  }
}
