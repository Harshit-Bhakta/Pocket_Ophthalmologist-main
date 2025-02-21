import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:pulse_social/Pages/Home_page.dart";
import "package:pulse_social/Pages/Sign%20In-Up/login.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  HomePage();
          } else {
            return SignInScreen();
          }
        },
      ),
    );
  }
}
