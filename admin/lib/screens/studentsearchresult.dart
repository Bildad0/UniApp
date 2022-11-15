import '/api/teacher_api.dart';
import '/api/student_api.dart';
import '/model/allmodels.dart';
import '/notifier/teacher_notifier.dart';
import '/notifier/student_notifier.dart';
import '/screens/student_form.dart';
import '/screens/search.dart';

import 'package:flutter/material.dart';
import '/screens/professors.dart';
import 'package:provider/provider.dart';

import 'teacher_form.dart';

class StudentSearchResult extends StatefulWidget {
  final data;
  StudentSearchResult({this.data});
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
        leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CloudFirestoreSearch(),
                ),
              );
            }),
        title: Text("Student"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      widget.data['image'] != null
                          ? widget.data['image']
                          : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: 24),
                    Text(
                      widget.data['name'],
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Father Name:",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        SizedBox(width: 6),
                        Text(
                          widget.data['fName'],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Roll No:",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        SizedBox(width: 6),
                        Text(
                          widget.data['rollNo'],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Phone:",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        SizedBox(width: 6),
                        Text(
                          widget.data['phone'],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Address:",
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        SizedBox(width: 6),
                        Text(
                          widget.data['address'],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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
