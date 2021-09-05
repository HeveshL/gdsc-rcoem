import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/screens/auth_screen.dart';
import 'package:gdsc/screens/home_screen.dart';

class AppHandler extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GDSC App',
      // TODO: Theme
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            // TODO: Make Error Screen
            return const Text("Something went wrong");
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return AuthHandler();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          // TODO: Make Splash Screen
          return const Text("Loading");
        },
      ),
    );
  }
}

class AuthHandler extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _firebaseAuth.authStateChanges(),
      builder: (context, snapshot) {
        // If user is logged in
        if (snapshot.hasData && !snapshot.data!.isAnonymous) {
          return  const HomeScreen();
        }
        // TODO: Add loading logic
        // If user is not Logged in
        else {
          return const AuthScreen();
        }
      },
    );
  }
}
