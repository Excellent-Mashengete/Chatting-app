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
      appBar: AppBar(title: const Text('Chats'), automaticallyImplyLeading: false), 
      body: const Center(
        child: Text('Chats Screen', style: TextStyle(fontSize: 40)),
      )
    );
  }
}
