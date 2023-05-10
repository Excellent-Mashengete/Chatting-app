import 'package:chattingapp/common/theme.dart';
import 'package:chattingapp/widgets/activechats.dart';
import 'package:chattingapp/widgets/recentchats.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatState();
}

class _ChatState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Chats'), automaticallyImplyLeading: false),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Text(
              "Messages",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: ThemeConstants.dark2Color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: ThemeConstants.dark2Color.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.all(Radius.circular(5)),
                              borderSide:BorderSide(color: Colors.transparent)
                            ),
                            hintText: "Search",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: ThemeConstants.light1Color,
                  ),
                ],
              ),
            ),
          ),
          const ActiveChats(),
          const RecentChats(),
        ],
      ),
    );
  }
}
