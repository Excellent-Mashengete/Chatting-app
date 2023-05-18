import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:chattingapp/screens/landing/landing_page.dart';
import 'package:chattingapp/screens/auth/auths.dart';
import 'package:chattingapp/providers/provider.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:chattingapp/common/common.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:chattingapp/model/models.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  setPathUrlStrategy(); //helps remove # from url in web
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter(); // initialize hive with the path of the directory.
  Hive.registerAdapter(UserAdapter());
  cameras = await availableCameras(); //for camera availability
  cameras2 = await availableCameras(); //for camera availability
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetUser(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
        home: const CheckAuthenticated());
  }
}


/*
FutureBuilder<Box>(
        future: Hive.openBox('user'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AsyncSnapshot.waiting()
          }else{
            if (snapshot.data?.getAt(5)!= null) {
              return const NavTabs();
            } else {
              return const Landing();
            }
          }
        },
      ),
      */