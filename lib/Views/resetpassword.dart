import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:uniapp/Utils/API/firebase_auth.dart';
import 'package:uniapp/main.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<StatefulWidget> createState() {
    return ResetPasswordState();
  }
}

class ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    "Reset your password".toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Card(
                  elevation: 5,
                  color: Colors.white10,
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          Neumorphic(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: TextFormField(
                              controller: emailcontroler,
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value != null) {
                                  if (!RegExp(
                                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                }
                                return 'Email is required';
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.email),
                                  iconColor: Colors.white,
                                  alignLabelWithHint: true,
                                  labelText: "Email"),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () async {
                              await Future.delayed(const Duration(seconds: 7),
                                  () {
                                context
                                    .read<AuthenticationService>()
                                    .resetPassword(
                                      email: emailcontroler.text.trim(),
                                    );
                              });
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const MyApp(),
                                ),
                              );
                            },
                            child: Text(
                              "Submit".toUpperCase(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
