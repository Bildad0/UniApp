// ignore_for_file: library_private_types_in_public_api

import '/notifier/teacher_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherContact extends StatefulWidget {
  final data;
  const TeacherContact({super.key, this.data});

  @override
  _TeacherContactState createState() => _TeacherContactState();
}

class _TeacherContactState extends State<TeacherContact> {
  @override
  Widget build(BuildContext context) {
    TeacherNotifier teacherNotifier = Provider.of<TeacherNotifier>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[400],
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            //highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text(
          "Contact",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            // clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Name:",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    const SizedBox(width: 6),
                    Text(
                      widget.data['name'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Email:",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    const SizedBox(width: 6),
                    Text(
                      widget.data['email'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Phone Number:",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    const SizedBox(width: 6),
                    Text(
                      widget.data['phone'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Address:",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    const SizedBox(width: 6),
                    Text(
                      widget.data['address'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
