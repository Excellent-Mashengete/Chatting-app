import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});
  
  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Calls'), automaticallyImplyLeading: false), 
      body: const Center(
        child: Text('Calls Screen', style: TextStyle(fontSize: 40)),
      )
    );
  }
}