import 'package:chattingapp/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: 'Profile'),
      body: Center(
        child: Text('Profile Screen', style: TextStyle(fontSize: 40)),
      )
    );
  }
}