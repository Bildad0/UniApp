// ignore_for_file: must_be_immutable

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:uniapp/Utils/API/firebase_auth.dart';

import 'package:uniapp/Views/resetpassword.dart';

class CustomForm extends StatefulWidget {
  CustomForm({super.key});
  late bool isLoading = false;

  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State<CustomForm> {
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();

  late bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            //add a logo here for the school
            Card(
              color: Colors.white10,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              elevation: 5,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Neumorphic(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextFormField(
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
                        controller: emailcontroler,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: "Email",
                          icon: Icon(Icons.email_rounded),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Neumorphic(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value != null) {
                            if (value.length < 6) {
                              return 'password must be six or more characters';
                            }
                            return null;
                          }
                          return "Password is required";
                        },
                        controller: passwordcontroler,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: "Password",
                          icon: Icon(Icons.lock_person),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NeumorphicButton(
                      style: NeumorphicStyle(
                        depth: 0,
                        color: Colors.green,
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                        //depth: 8,
                        lightSource: LightSource.topRight,
                      ),
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
                        // userData(email: emailcontroler.text.trim());
                      },
                      child: isLoading
                          ? const SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                color: Colors.blueGrey,
                                backgroundColor: Colors.white,
                              ),
                            )
                          : Text('LogIn'.toUpperCase()),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ResetPassword()))
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
