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
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.green.withOpacity(0.6),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => AfterLogin(),
              //   ),
              // );
            }),
        title: const Text("Professors"),
        centerTitle: true,
        backgroundColor: Colors.brown,
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
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          color: Colors.green[400],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                  icon: const Icon(Icons.person_add),
                                  color: Colors.white,
                                  iconSize: 20,
                                  highlightColor: Colors.pink,
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
                        Container(
                          child: Card(
                            color: Colors.blue[400],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(Icons.view_column),
                                    color: Colors.white,
                                    iconSize: 20,
                                    highlightColor: Colors.pink,
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Feed(),
                                        ),
                                      );
                                    }),
                                const Text("View Professors",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
