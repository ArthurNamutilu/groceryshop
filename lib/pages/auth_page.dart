// USER IS SIGNEDIN? YES-> DISPLAY INTRO SCREEN   ||  NO -> DISPALY LOGIN PAGE

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'home_page.dart';
import 'home_page.dart';
//import 'intro_screen.dart';
import 'login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance
            .authStateChanges(), // checks if user is loged in or not
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomePage();
          }

          // user is NOT logged in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
