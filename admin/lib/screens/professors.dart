// ignore_for_file: library_private_types_in_public_api

import '/api/teacher_api.dart';
import '/notifier/teacher_notifier.dart';
import '/screens/feed.dart';

import '/screens/teacher_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'afterlogin.dart';

class Professors extends StatefulWidget {
  const Professors({super.key});

  @override
  _ProfessorsState createState() => _ProfessorsState();
}

class _ProfessorsState extends State<Professors> {
  @override
  void initState() {
    TeacherNotifier teacherNotifier =
        Provider.of<TeacherNotifier>(context, listen: false);
    getTeachers(teacherNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TeacherNotifier teacherNotifier = Provider.of<TeacherNotifier>(context);

    Future<void> _refreshList() async {
      getTeachers(teacherNotifier);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            //highlightColor: Colors.green.withOpacity(0.6),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AfterLogin(),
                ),
              );
            }),
        title: const Text(
          "Professors",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.withOpacity(0.5),
      ),
//body:_children[_currentIndex],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/school.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      children: [
                        Card(
                          color: Colors.green.withOpacity(0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.person_add),
                                  color: Colors.white,
                                  iconSize: 20,
                                  //highlightColor: Colors.pink,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const TeacherForm(
                                                isUpdating: false,
                                              )),
                                    );
                                  }),
                              const Text("Add Professors",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.blue.withOpacity(0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.view_column),
                                  color: Colors.white,
                                  iconSize: 20,
                                  //highlightColor: Colors.pink,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Feed(),
                                      ),
                                    );
                                  }),
                              const Text("View Professors",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
