import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _MessageTitle(
            messageData: MessageData(
              senderName: "Shaggy",
              message: "Hello Developer, How are you?",
              messageDate: "date",
              dateMessage: "12:30",
              profilePicture:
                  'https://avatarfiles.alphacoders.com/103/103808.jpg',
            ),
          ),
           _MessageTitle(
          messageData: MessageData(
            senderName: "Koketso",
            message: "Hi Nhlanhla",
            messageDate: "date",
            dateMessage: "12:30",
            profilePicture:
                'https://avatarfiles.alphacoders.com/975/97500.jpg',
          ),
        ),
         _MessageTitle(
          messageData: MessageData(
            senderName: "Chris",
            message: "I need your help",
            messageDate: "date",
            dateMessage: "12:30",
            profilePicture:
                'https://avatarfiles.alphacoders.com/103/103808.jpg',
          ),
        ),
        _MessageTitle(
          messageData: MessageData(
            senderName: "Ronald",
            message: "Have you completed the fragments",
            messageDate: "date",
            dateMessage: "12:30",
            profilePicture:
              'https://avatarfiles.alphacoders.com/226/226604.png',
          ),
        )
    ]);
  }
}

class _MessageTitle extends StatelessWidget {
  const _MessageTitle({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, messages,
            arguments: messageData);
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.network(
                    messageData.profilePicture,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        messageData.senderName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          letterSpacing: 0.2,
                          wordSpacing: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                        messageData.message,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xFFF5F5F5).withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      messageData.dateMessage.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Text(
                        "10",
                        style: TextStyle(
                            color: Color(0xFF122646),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
