// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:uniapp/Views/notes.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  _UnitPageState createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Unit Name",
          style: TextStyle(
              color: Color.fromARGB(255, 43, 84, 155),
              fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () => {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const NotesPage()))
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.blueGrey,
          ),
        ),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: Center(
                    child: Column(
                  children: const [
                    Text("Anouncements"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "All students Should finish their assignements on time."),
                  ],
                )),
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
                child: Center(
                  child: Text(
                    "Unit Topics",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
