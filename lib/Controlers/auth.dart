import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniapp/Views/homepage.dart';
import 'package:uniapp/Views/loginpage.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomePage();
    }
    return const LogIn();
  }
}

class FingurePrint extends StatelessWidget {
  const FingurePrint({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
