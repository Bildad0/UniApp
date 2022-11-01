import 'dart:async';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:uniapp/EditProfile/edit_profile.dart';
import 'package:uniapp/Views/unit_overview.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotesPageState createState() => _NotesPageState();
}

var year = DateFormat('y').format(DateTime.now());
var month = DateFormat('MMM').format(DateTime.now());
var date = DateTime.now().day;

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const EditProfilePage()));
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  blurRadius: 12,
                                  spreadRadius: 8,
                                )
                              ],
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Learning Dashboard",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Color(0XFF343E87),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text(
                                "Resently Accessed Courses",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Card(
                    shadowColor: const Color.fromARGB(255, 177, 195, 226),
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: Color.fromARGB(255, 148, 148, 194),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Computer Architecture",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Dr. Hadullo"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Card(
                    shadowColor: const Color.fromARGB(255, 177, 195, 226),
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: Color.fromARGB(255, 148, 148, 194),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Computer Architecture",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Dr. Hadullo"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Card(
                    shadowColor: const Color.fromARGB(255, 177, 195, 226),
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: Color.fromARGB(255, 148, 148, 194),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Computer Architecture",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Dr. Hadullo",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Introduction to computer Architecture"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                Divider(
                  color: Colors.black,
                ),
                Center(
                  child: Text(
                    "This semester Courses",
                    style: TextStyle(
                        color: Color(0XFF343E87), fontWeight: FontWeight.bold),
                  ),
                ),
                CourseOverview(),
                SizedBox(
                  height: 10,
                ),
                CourseOverview(),
                SizedBox(
                  height: 10,
                ),
                CourseOverview(),
                SizedBox(
                  height: 10,
                ),
                CourseOverview(),
                Divider(
                  color: Colors.black,
                ),
                Center(
                  child: Text(
                    "Previous Semester Exam Result",
                    style: TextStyle(
                        color: Color(0XFF343E87),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ExamResult(),
                SizedBox(
                  height: 10,
                ),
                ExamResult(),
                SizedBox(
                  height: 10,
                ),
                ExamResult(),
                SizedBox(
                  height: 10,
                ),
                ExamResult(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseOverview extends StatelessWidget {
  const CourseOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      blurRadius: 12,
                      spreadRadius: 8,
                    )
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              GestureDetector(
                onTap: (() => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const UnitPage()))
                    }),
                child: Column(
                  children: const [
                    Text("Code"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Introduction to Computer ")
                  ],
                ),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Progress"),
                  ProgressBar(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});
  @override
  State<StatefulWidget> createState() {
    return ProgressBarState();
  }
}

class ProgressBarState extends State<ProgressBar> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: _loading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(
                  backgroundColor: Colors.cyanAccent,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  value: _progressValue,
                ),
                Text('${(_progressValue * 100).round()}%'),
              ],
            )
          : GestureDetector(
              child: const Text(
                "View",
                style: TextStyle(fontSize: 25),
              ),
              onTap: () => {
                setState(() {
                  _loading = !_loading;
                  _updateProgress();
                }),
              },
            ),
    );
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue = 50;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          return;
        }
      });
    });
  }
}

class ExamResult extends StatefulWidget {
  const ExamResult({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExamResultState();
  }
}

class ExamResultState extends State<ExamResult> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      blurRadius: 12,
                      spreadRadius: 8,
                    )
                  ],
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: const [
                  Text("Code"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Software Development and management")
                ],
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
                children: const [
                  Text("Grade"),
                  Text("A"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
