// ignore_for_file: unused_local_variable, unused_element, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/api/student_api.dart';
import '/notifier/auth_notifier.dart';
import '/notifier/student_notifier.dart';
import '/screens/studentDetail.dart';
import '/screens/students.dart';

class ViewStudents extends StatefulWidget {
  const ViewStudents({super.key});

  @override
  _ViewStudentsState createState() => _ViewStudentsState();
}

class _ViewStudentsState extends State<ViewStudents> {
  @override
  void initState() {
    StudentNotifier studentNotifier =
        Provider.of<StudentNotifier>(context, listen: false);
    getStudents(studentNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    StudentNotifier studentNotifier = Provider.of<StudentNotifier>(context);

    Future<void> refreshList() async {
      getStudents(studentNotifier);
    }

    print("Students List");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            //highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Students(),
                ),
              );
            }),
        title: const Text(
          "List of Students",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[400],
      ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(
                studentNotifier.studentList[index].image,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              title: Text(studentNotifier.studentList[index].name),
              subtitle: Text(studentNotifier.studentList[index].rollNo),
              onTap: () {
                studentNotifier.currentStudent =
                    studentNotifier.studentList[index];
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const StudentDetail();
                }));
              },
            );
          },
          itemCount: studentNotifier.studentList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.black,
            );
          },
        ),
      ),
    );
  }
}
