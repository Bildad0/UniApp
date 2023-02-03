import 'dart:io';

import 'package:admin/notifier/authentication_wrapper.dart';
import 'package:flutter/foundation.dart';

import './notifier/fee_notifier.dart';
import './notifier/teacher_notifier.dart';
import './screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifier/auth_notifier.dart';
import 'firebase_options.dart';
import 'notifier/student_notifier.dart';

Future<void> main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => TeacherNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => FeeNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => StudentNotifier(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.green),
      ),
      home: Consumer<AuthNotifier>(
        //AuthNotifier is here in order to  access the user which is in AuthNotifier
        builder: (context, notifier, child) {
          return notifier.user == null
              ? const AuthenticationWrapper()
              : const Login();
        },
      ),
    );
  }
}
