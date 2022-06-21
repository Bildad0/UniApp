import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:uniapp/Providers/authservice.dart';

class LogIn extends StatelessWidget {
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: emailcontroler,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: passwordcontroler,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                      email: emailcontroler.text.trim(),
                      password: passwordcontroler.text.trim(),
                    );
              },
              child: Text('SignIn'.toUpperCase()),
            )
          ],
        ),
      ),
    );
  }
}
