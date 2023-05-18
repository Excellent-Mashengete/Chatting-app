import 'package:flutter/material.dart';
import 'package:chattingapp/model/models.dart';

class ContactView extends StatelessWidget {
  const ContactView({
    Key? key,
    required this.messageData,
  }): super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( 
        leading: IconButton(
          onPressed: (){ Navigator.pop(context); },
          icon: const Icon(Icons.arrow_back),
        ),
      ), 
      body: Container(
        
      )
    );
  }
}