import 'package:camera/camera.dart';
import 'package:chattingapp/providers/chat_provider.dart';
import 'package:chattingapp/screens/landing/landing_page.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/routes.dart';
import 'package:chattingapp/common/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

late Box box1;
Future<void> main() async {
  await Hive.initFlutter();
  box1 = await Hive.openBox('user');
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras(); //for camera availability
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ChatProvider()),
  ], child: const MyApp()));
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
      home: box1.get('logintype', defaultValue: false)
          ? const NavTabs()
          : const Landing(),
    );
  }
}
