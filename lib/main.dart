import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkjs_flutter/talkjs_flutter.dart';
import 'package:uniapp/Providers/authservice.dart';
import 'package:uniapp/Controlers/auth.dart';
import 'package:uniapp/Views/Chats/chart_details_page.dart';
import 'package:uniapp/Views/Chats/chatpage.dart';
import 'package:uniapp/Views/homepage.dart';
import 'package:uniapp/widgets/conversation_list.dart';

Future<void> main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
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
