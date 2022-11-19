import '/api/student_api.dart';
import '/notifier/student_notifier.dart';
import '/screens/afterlogin.dart';

import '/screens/student_form.dart';
import '/screens/view_students.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  @override
  void initState() {
    StudentNotifier studentNotifier =
        Provider.of<StudentNotifier>(context, listen: false);
    getStudents(studentNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StudentNotifier studentNotifier = Provider.of<StudentNotifier>(context);

    Future<void> _refreshList() async {
      getStudents(studentNotifier);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.green,
            iconSize: 40,
            // highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AfterLogin(),
                ),
              );
            }),
        title: const Text(
          "Students",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
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
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.pink[300]),
                    child: Column(
                      children: [
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
                                        const StudentForm(
                                          isUpdating: false,
                                        )),
                              );
                            }),
                        const Text("Add Students",
                            style: TextStyle(color: Colors.white))
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.green[300]),
                    child: Column(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.view_column),
                            color: const Color.fromARGB(255, 236, 5, 5),
                            iconSize: 20,
                            highlightColor: Colors.pink,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const ViewStudents(),
                                ),
                              );
                            }),
                        const Text("View Students",
                            style: TextStyle(color: Colors.white))
                      ],
                    )),
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
