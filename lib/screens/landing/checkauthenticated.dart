import 'package:chattingapp/common/common.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/helpers/biometric_helper.dart';
import 'package:chattingapp/screens/landing/landing_page.dart';
import 'package:chattingapp/screens/landing/splashcsreen.dart';
import 'package:chattingapp/providers/get_user.dart';
import 'package:chattingapp/providers/provider.dart';
import 'package:chattingapp/screens/tabs/tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chattingapp/model/models.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CheckAuthenticated extends StatefulWidget {
  const CheckAuthenticated({super.key});

  @override
  State<CheckAuthenticated> createState() => _CheckAuthenticatedState();
}

class _CheckAuthenticatedState extends State<CheckAuthenticated> {
  bool showBiometrics = false;
  bool isAuthenticated = false;

  @override
  void initState() {
    isBiometricAvailable();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  isBiometricAvailable() async {
    showBiometrics = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
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
    var user = Provider.of<GetUser>(context, listen: false);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show the splash screen while waiting for the future to complete
          return const SplashScreen();
        } else {
          // Handle the result of the future and return the appropriate UI
          if (snapshot.hasData) {
            user.addUser(CurrentUser(
                name: snapshot.data!.displayName,
                email: snapshot.data!.email,
                phoneNumber: snapshot.data!.phoneNumber,
                avatar: snapshot.data!.photoURL));
            user.addToken(Token(
              token: snapshot.data!.refreshToken,
            ));
            user.addUserID(UserId(
              uid: snapshot.data!.uid,
            ));
            return Scaffold(
              backgroundColor: ThemeConstants.dark1Color,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const Icon(Icons.lock, size: 50),
                    const SizedBox(height: 30),
                    const Text(
                      'ChattingApp Locked',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 200),
                    
                    if (showBiometrics)
                      InkWell(
                        onTap: () async {
                          isAuthenticated =
                            await BiometricHelper().authenticate();
                              // ignore: use_build_context_synchronously
                              if(isAuthenticated) Navigator.pushNamed(context, homepage);
                        },
                        child: const Icon(Icons.fingerprint, size: 60, color: ThemeConstants.light1Color)
                      ),
                    
                    const SizedBox(height: 30),
                    const Text(
                      'Touch the fingerprint sensor',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Landing();
          }
        }
      },
    );
  }
}
