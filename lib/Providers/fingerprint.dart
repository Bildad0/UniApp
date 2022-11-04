// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:uniapp/Views/landingpage.dart';
import 'package:uniapp/Views/loginpage.dart';

LocalAuthentication auth = LocalAuthentication();
Future authenticate() async {
  final bool isBiometricsAvailable = await auth.isDeviceSupported();

  if (!isBiometricsAvailable) return false;

  try {
    return await auth.authenticate(
      localizedReason: 'Scan Fingerprint To login',
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
        backgroundColor: Colors.white10,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          const Center(
            child: Text("Verify Your Identity"),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
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
            child: const Icon(Icons.fingerprint),
          ),
        ],
      ),
    );
  }
}
