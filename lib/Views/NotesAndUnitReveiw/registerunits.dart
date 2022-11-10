import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class RegisterUnits extends StatefulWidget {
  const RegisterUnits({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterUnitsState();
  }
}

class _RegisterUnitsState extends State<RegisterUnits> {
  @override
  Widget build(BuildContext context) {
    String? register;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => {
            Navigator.pop(context),
          },
          child: Column(
            children: const [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              Text(
                "Back",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio(
                    value: "Register",
                    groupValue: register,
                    onChanged: (value) {
                      setState(() {
                        register = value.toString();
                      });
                    }),
                const Text("Introduction to computer Science"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: "Register",
                    groupValue: register,
                    onChanged: (value) {
                      setState(() {
                        register = value.toString();
                      });
                    }),
                const Text("Software design and Implimentation"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: "Register",
                    groupValue: register,
                    onChanged: (value) {
                      setState(() {
                        register = value.toString();
                      });
                    }),
                const Text("Installation and customization"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: "Register",
                    groupValue: register,
                    onChanged: (value) {
                      setState(() {
                        register = value.toString();
                      });
                    }),
                const Text("Network protocals and configuration"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: "Register",
                    groupValue: register,
                    onChanged: (value) {
                      setState(() {
                        register = value.toString();
                      });
                    }),
                const Text("Communication skills"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text("Submit")),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
