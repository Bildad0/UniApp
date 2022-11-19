// ignore_for_file: no_leading_underscores_for_local_identifiers

import '/api/student_api.dart';
import '/model/allmodels.dart';
import '/notifier/student_notifier.dart';
import '/screens/student_form.dart';
import '/screens/students.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentDetail extends StatelessWidget {
  const StudentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    StudentNotifier studentNotifier = Provider.of<StudentNotifier>(context);

    _onStudentDeleted(Student student) {
      Navigator.pop(context);
      studentNotifier.deleteStudent(student);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Students(),
                ),
              );
            }),
        title: const Text("Student"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.network(
                    studentNotifier.currentStudent.image,
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    studentNotifier.currentStudent.name,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Father Name: ${studentNotifier.currentStudent.fName}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Phone: ${studentNotifier.currentStudent.phone}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Roll No: ${studentNotifier.currentStudent.rollNo}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Registration No: ${studentNotifier.currentStudent.registrationNo}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Address: ${studentNotifier.currentStudent.address}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'button1',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const StudentForm(
                    isUpdating: true,
                  );
                }),
              );
            },
            foregroundColor: Colors.white,
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'button2',
            onPressed: () => deleteStudent(
                studentNotifier.currentStudent, _onStudentDeleted),
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
