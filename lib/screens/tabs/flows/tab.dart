import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
late Box box1;

class NavTabs extends StatefulWidget {
  const NavTabs({super.key});

  @override
  State<NavTabs> createState() => _TabsState();
}

class _TabsState extends State<NavTabs> {

  int currentTab = 0;
  final List<Widget> screens = [
    const Chats(),
    const ContactsPage(),
    const Calls(),
  ];

  bool isApiCallProcessing = false;


  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcessing,
      opacity: 0.2,
      child: uiSetup(context),
    );
  }

  Widget uiSetup(BuildContext context) {
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

                  // switch (index) {
                  //   case 0:

                  //     break;
                  //   case 1:
                  //     //print("Concts");
                  //     break;
                  //   case 2:
                  //     // print("Calls");
                  //     break;
                  // }
                },);
              },
              tabs: [
                GButton(
                  icon: currentTab == 0
                      ? Icons.chat_rounded
                      : Icons.chat_bubble_outline_rounded,
                  iconColor: const Color(0xFFF5F5F5).withOpacity(0.7),
                  text: "Chats",
                ),
                GButton(
                  icon: currentTab == 1
                      ? Icons.people_alt
                      : Icons.people_alt_outlined,
                  iconColor: const Color(0xFFF5F5F5).withOpacity(0.7),
                  text: "Contacts",
                ),
                GButton(
                  icon: currentTab == 2
                      ? CupertinoIcons.phone_fill
                      : CupertinoIcons.phone,
                  iconColor: const Color(0xFFF5F5F5).withOpacity(0.7),
                  text: "Calls",
                ),
              ],),
        ),
      ),
      body: Center(
        child: screens[currentTab],
      ),
    );
  }
}
