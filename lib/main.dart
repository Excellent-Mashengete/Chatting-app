import 'package:chattingapp/screens/landing/landing_page.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:chattingapp/service/hive.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/routes.dart';
import 'package:chattingapp/common/theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  
  late bool logged = false;
  void retrieveisloggedin() async {
    logged = getLogginType() as bool;
  }
  
  // @override
  // void initState() {
  //   super.initState();
  //   initialization();
  // }

  // void initialization() async {
  //   // This is where you can initialize the resources needed by your app while
  //   // the splash screen is displayed.  Remove the following example because
  //   // delaying the user experience is a bad design practice!
  //   // ignore_for_file: avoid_print
  //   print('ready in 3...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('ready in 2...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('ready in 1...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('go!');
  //   FlutterNativeSplash.remove();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: dark,
      home: logged ? const Landing() : const NavTabs(),
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: landing,
      debugShowCheckedModeBanner: false,
      
    );
  }
}

