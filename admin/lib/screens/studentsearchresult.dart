// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers

import '/model/allmodels.dart';
import '/notifier/student_notifier.dart';
import '/screens/search.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentSearchResult extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const StudentSearchResult({super.key, this.data});
  @override
  _StudentSearchResultState createState() => _StudentSearchResultState();
}

class _StudentSearchResultState extends State<StudentSearchResult> {
  @override
  Widget build(BuildContext context) {
    StudentNotifier studentNotifier = Provider.of<StudentNotifier>(context);

    _onStudentDeleted(Student student) {
      Navigator.pop(context);
      studentNotifier.deleteStudent(student);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.green,
            iconSize: 40,
            //highlightColor: Colors.pink,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const CloudFirestoreSearch(),
                ),
              );
            }),
        title: const Text(
          "Student",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      widget.data['name'],
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Student's Name:",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        const SizedBox(width: 6),
                        Text(
                          widget.data['fName'],
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
                        const Text("Roll No:",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        const SizedBox(width: 6),
                        Text(
                          widget.data['rollNo'],
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
                        const Text("Registration No:",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        const SizedBox(width: 6),
                        Text(
                          widget.data['registrationNo'],
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
                        const Text("Phone:",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        const SizedBox(width: 6),
                        Text(
                          widget.data['phone'].toString(),
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
                          widget.data['address'],
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red)),
                        onPressed: () => {_onStudentDeleted(widget.data.doc)},
                        //,
                        child: Text(
                          "Delete".toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
