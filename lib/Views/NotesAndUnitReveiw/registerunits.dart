import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
