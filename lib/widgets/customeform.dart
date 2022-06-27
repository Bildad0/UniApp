import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniapp/Providers/authservice.dart';

class CustomForm extends StatefulWidget {
  CustomForm({super.key});
  late bool isLoading = false;

  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();

  late bool isLoading = true;

  String? get _errorText {
    final mailtext = emailcontroler.text;
    final passtext = passwordcontroler.text;
    if (passtext.isEmpty || mailtext.isEmpty) {
      return 'can\'t be empty';
    } else if (passtext.length < 6) {
      return 'Password is too short';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Column(
        children: [
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) => _errorText,
                  controller: emailcontroler,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    icon: Icon(Icons.email_sharp),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) => _errorText,
                  controller: passwordcontroler,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.key_sharp),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });

              await Future.delayed(const Duration(seconds: 6), () {
                setState(() {
                  isLoading = !isLoading;
                });
                context.read<AuthenticationService>().signIn(
                      email: emailcontroler.text.trim(),
                      password: passwordcontroler.text.trim(),
                    );
              });
            },
            child: Text('LogIn'.toUpperCase()),
          )
        ],
      ),
    );
  }
}
