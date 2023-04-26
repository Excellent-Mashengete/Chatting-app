import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';


class Chats extends StatefulWidget {
  const Chats({super.key});
  
  @override
  State<Chats> createState() => _ChatState();
}

class _ChatState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: 'Chats'),
      body: Center(
        child: Text('Chats Screen', style: TextStyle(fontSize: 40)),
      )
    );
  }
}