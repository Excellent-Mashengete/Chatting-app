import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/model/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
    Key? key,
    required this.chats,
  }) : super(key: key);

  final ChatResponseModel chats;
  String formatMessageDate(String dateString) { 
    DateTime now = DateTime.now(); 
    DateTime messageDate = DateTime.parse(dateString); 
    Duration difference = now.difference(messageDate); 
    
    if (difference.inSeconds < 1) { 
      return "Just now"; 
    } else if (difference.inSeconds < 60) { 
      return "${difference.inSeconds} seconds ago"; 
    } else if (difference.inHours < 24 && now.day == messageDate.day) { 
      return '${messageDate.hour.toString().padLeft(2, '0')}:${messageDate.minute.toString().padLeft(2, '0')}'; 
    } else if (difference.inDays == 1 || (difference.inHours < 24 && now.day != messageDate.day)) { 
      return "Yesterday"; 
    } else { 
      return DateFormat('dd MMM yyyy').format(messageDate);
    } 
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, messages, arguments: chats);
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
                    chats.chats!.first.receiver!.avatar.toString(),
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
                        chats.chats!.first.receiver!.name.toString(),
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
                       chats.chats!.first.lastMessage!.messages.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ThemeConstants.light1Color.withOpacity(0.7),
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
                      formatMessageDate(chats.chats!.first.lastMessage!.datesend.toString()),
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
                          color: ThemeConstants.light1Color,
                          borderRadius: BorderRadius.circular(25)),
                      child: 
                      Text(
                        "10",
                        style: TextStyle(
                            color: ThemeConstants.dark2Color,
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
