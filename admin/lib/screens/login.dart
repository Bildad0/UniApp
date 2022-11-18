// ignore_for_file: constant_identifier_names, unnecessary_null_comparison, avoid_print

import 'package:admin/screens/afterlogin.dart';
import 'package:flutter/cupertino.dart';

import '/api/teacher_api.dart';
import '/model/user.dart';
import '/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailcontroler = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  AuthMode _authMode = AuthMode.Login;

  final MyUser _user = MyUser();

  @override
  void initState() {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    super.initState();
  }

  _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AfterLogin()));
    }

    _formKey.currentState?.save();

    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    if (_authMode == AuthMode.Login) {
      login(_user, authNotifier);
    } else {
      signup(_user, authNotifier);
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: const Text(
          'Error !',
          style: TextStyle(color: Colors.red),
        ),
        actions: [
          CupertinoDialogAction(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Check your Details",
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('Ok'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDisplayNameField() {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      cursorColor: Colors.black,
      validator: (value) {
        if (value == null) {
          return 'Display Name is required';
        }

        if (value.length < 5 || value.length > 12) {
          return 'Display Name must be betweem 5 and 12 characters';
        }

        return null;
      },
      onSaved: (value) {
        _user.displayName = _usernameController.text;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailcontroler,
      decoration: InputDecoration(
        labelText: 'Email',
        fillColor: Colors.black,
        hintText: "admin@gmail.com",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      keyboardType: TextInputType.emailAddress,
      //  initialValue: 'admin@gmail.com',
      style: const TextStyle(fontSize: 15, color: Colors.black),
      cursorColor: Colors.black,
      validator: ((value) {
        if (value == null) {
          return 'Email is required';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      }),
      onSaved: (value) {
        _user.email = _emailcontroler.text;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      style: const TextStyle(fontSize: 15, color: Colors.black),
      cursorColor: Colors.white,
      obscureText: true,
      controller: _passwordController,
      validator: ((value) {
        if (value == null) {
          return 'Password is required';
        }

        if (value.length < 6) {
          return 'Password must be more than 6 and characters';
        }

        return null;
      }),
      onSaved: (value) {
        _user.password = _passwordController.text;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm pasword',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      style: const TextStyle(fontSize: 15, color: Colors.black),
      cursorColor: Colors.white,
      obscureText: true,
      validator: (value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Building login screen");

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/school.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 96, 32, 0),
              child: Column(
                children: <Widget>[
                  Text(
                    ' ${_authMode == AuthMode.Signup ? 'Sign Up' : 'Log In'}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 36, color: Colors.black),
                  ),
                  const SizedBox(height: 32),
                  _authMode == AuthMode.Signup
                      ? _buildDisplayNameField()
                      : Container(),
                  const SizedBox(height: 16),
                  _buildEmailField(),
                  const SizedBox(height: 16),
                  _buildPasswordField(),
                  const SizedBox(height: 16),
                  _authMode == AuthMode.Signup
                      ? _buildConfirmPasswordField()
                      : Container(),
                  const SizedBox(height: 32),
                  ButtonTheme(
                    minWidth: 200,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      //padding:
                      onPressed: () => {
                        print(_emailcontroler.text),
                        print(_passwordController.text),
                        print(_usernameController.text),
                        _submitForm(),
                      },
                      child: Text(
                        _authMode == AuthMode.Login ? 'Login' : 'Signup',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                    child: Text("OR"),
                  ),
                  ButtonTheme(
                    minWidth: 200,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                      ),
                      child: Text(
                        ' ${_authMode == AuthMode.Signup ? 'Login' : ' Create Account'}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          _authMode = _authMode == AuthMode.Login
                              ? AuthMode.Signup
                              : AuthMode.Login;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
