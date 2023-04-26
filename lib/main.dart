import 'package:flutter/material.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/routes.dart';
import 'package:chattingapp/common/theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: dark,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: landing,
      debugShowCheckedModeBanner: false,
    );
  }
}
