import 'package:chattingapp/screens/Tabs/components/chats.dart';
import 'package:chattingapp/screens/Tabs/components/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class NavTabs extends StatefulWidget {
  const NavTabs({super.key});
  
  @override
  State<NavTabs> createState() => _TabsState();
}

class _TabsState extends State<NavTabs> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Chats(),
    const Profile(),
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
            tabBackgroundColor: const Color.fromARGB(255, 74, 74, 74),
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
                icon: currentTab == 0 ? Icons.chat_rounded : Icons.chat_bubble_outline_rounded,
                text: "Chats",
              ),
              GButton(
                icon: currentTab == 1 ? Icons.person : Icons.person_outline,
                text: "Profile",
              ),
            ]
          ),
        ),
      ),
      body: Center(
        child: screens[currentTab],
      ),
    );
  }
}