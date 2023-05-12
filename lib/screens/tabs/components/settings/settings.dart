import 'package:chattingapp/constants.dart';
import 'package:chattingapp/service/hive.dart';
import 'package:chattingapp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final HandleHive sharedHive = HandleHive();

  @override
  void initState() {
    super.initState();
    sharedHive.removeAllData();
  }

  void openBox() async {
    sharedHive.removeAllData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: AppBar(
              backgroundColor: const Color(0xFF122646),
              leadingWidth: 30,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: IconBorder(
                      icon: CupertinoIcons.arrow_left,
                      size: 25,
                      onTap: () {
                        sharedHive.removeAllData();
                        Navigator.pushReplacementNamed(context, landing);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const Center(
          child: Text('Settings Screen', style: TextStyle(fontSize: 40)),
        ));
  }
}
