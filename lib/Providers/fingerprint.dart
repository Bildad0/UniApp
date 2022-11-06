// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:uniapp/Views/landingpage.dart';
import 'package:uniapp/Views/loginpage.dart';

LocalAuthentication auth = LocalAuthentication();
Future authenticate() async {
  final bool isBiometricsAvailable = await auth.isDeviceSupported();

  if (!isBiometricsAvailable) return false;

  try {
    return await auth.authenticate(
      localizedReason: 'Scan Fingerprint To Login',
      options: const AuthenticationOptions(
        useErrorDialogs: true,
        stickyAuth: true,
      ),
    );
  } on PlatformException {
    return;
  }
}

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FingerPrintState createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Text(
                "Welcome Back".toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(180, 60, 0, 60),
              child: SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    //backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
                    elevation: MaterialStatePropertyAll(0),
                  ),
                  onPressed: () async {
                    bool isAuthenticated = await authenticate();
                    if (isAuthenticated) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SchoolManagement();
                          },
                        ),
                      );
                    } else {
                      const LogIn();
                    }
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
