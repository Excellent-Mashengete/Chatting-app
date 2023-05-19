import 'package:chattingapp/screens/landing/landing_page.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class CheckAuthenticated extends StatefulWidget {
  const CheckAuthenticated({super.key});

  @override
  State<CheckAuthenticated> createState() => _CheckAuthenticatedState();
}

class _CheckAuthenticatedState extends State<CheckAuthenticated> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Delay the splash screen by a desired duration
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box>(
      future: Hive.openBox('token'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show the splash screen while waiting for the future to complete
          return const Landing();
        } else {
          // Handle the result of the future and return the appropriate UI
          if (snapshot.data!.isEmpty) {
            return const NavTabs();
          } else {
            return const Landing();
          }
        }
      },
    );
  }
}

/*



    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const NavTabs();
          }else{
            return const Landing();
          }
        }
    );
 */

