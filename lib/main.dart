import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniapp/Providers/authservice.dart';
import 'package:uniapp/Controlers/auth.dart';

Future<void> main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        name: "UniApp",
        options: const FirebaseOptions(
            apiKey: 'AIzaSyCiL9ATYW2dI62_OjHJ4WYcNimzT69JwDo',
            appId: '1:708691986820:android:f2cd7f96b2a51c26cdf5d1',
            messagingSenderId: '708691986820',
            projectId: 'uniapp-bacf3'));
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null,
          )
        ],
        child: MaterialApp(
          //I will add some routes
          // initialRoute: "/",
          // routes: {
          //   '/': (context) => const HomePage(),
          //   '/chatbox': (context) => const ChatDetailPage(),
          // },
          theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: const AuthenticationWrapper(),
        ));
  }
}
