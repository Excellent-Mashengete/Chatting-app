import 'package:chattingapp/screens/Tabs/components/chats.dart';
import 'package:chattingapp/screens/tabs/components/calls.dart';
import 'package:chattingapp/screens/tabs/components/contacts.dart';
import 'package:chattingapp/screens/tabs/components/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class NavTabs extends StatefulWidget {
  const  NavTabs({super.key});

  @override
  State<NavTabs> createState() => _TabsState();
}

class _TabsState extends State<NavTabs> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Chats(),
    const Contacts(),
    const Calls(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromARGB(0, 61, 61, 61),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              backgroundColor: const Color.fromARGB(0, 61, 61, 61),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color(0xFF122646),
              gap: 8,
              padding: const EdgeInsets.all(15),
              selectedIndex: currentTab,
              onTabChange: (index) {
                setState(() {
                  currentTab = index;
                });
              },
              tabs: [
                GButton(
                  icon: currentTab == 0
                      ? Icons.chat_rounded
                      : Icons.chat_bubble_outline_rounded,iconColor: const Color(0xFFF5F5F5).withOpacity(0.7),
                  text: "Chats",
                ),
                GButton(
                  icon: currentTab == 1 ? Icons.people_alt : Icons.people_alt_outlined,iconColor: const Color(0xFFF5F5F5).withOpacity(0.7),
                  text: "Contacts",
                ),
                 GButton(
                  icon: currentTab == 2 ? CupertinoIcons.phone_fill : CupertinoIcons.phone,iconColor: const Color(0xFFF5F5F5).withOpacity(0.7),
                  text: "Calls",
                ),
                 GButton(
                  icon: currentTab == 3 ? Icons.settings : Icons.settings_outlined, iconColor: const Color(0xFFF5F5F5).withOpacity(0.7),
                  text: "Settings",
                ),
              ]),
        ),
      ),
      body: Center(
        child: screens[currentTab],
      ),
    );
  }
}
