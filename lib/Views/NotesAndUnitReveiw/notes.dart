import 'dart:async';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:uniapp/EditProfile/edit_profile.dart';
import 'package:uniapp/Views/NotesAndUnitReveiw/registerunits.dart';
import 'package:uniapp/Views/NotesAndUnitReveiw/unit_overview.dart';

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
                  child: GestureDetector(
                    onTap: (() => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const UnitPage()))
                        }),
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
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: GestureDetector(
                    onTap: (() => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const UnitPage()))
                        }),
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
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: GestureDetector(
                    onTap: (() => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const UnitPage()))
                        }),
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
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Divider(
                    color: Colors.black,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "This semester Courses",
                          style: TextStyle(
                              color: Color(0XFF343E87),
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const RegisterUnits()))
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CourseOverview(),
                  const CourseOverview(),
                  const CourseOverview(),
                  const CourseOverview(),
                  const Divider(
                    color: Colors.black,
                  ),
                  const Center(
                    child: Text(
                      "Previous Semester Exam Result",
                      style: TextStyle(
                          color: Color(0XFF343E87),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ExamResult(),
                  const ExamResult(),
                  const ExamResult(),
                  const ExamResult(),
                  const ExamResult(),
                ],
              ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                color: Colors.white,
                thickness: 10,
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
                color: Colors.white,
                thickness: 10,
              ),
              SizedBox(
                height: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Progress"),
                    ProgressBar(),
                  ],
                ),
              ),
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
  ProgressBarState createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBar> {
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: _loading
          ? const LinearProgressIndicator()
          : GestureDetector(
              child: const Text(
                "View",
                style: TextStyle(fontSize: 25),
              ),
              onTap: () => {
                setState(() {
                  _loading = !_loading;
                }),
              },
            ),
    );
  }

  // void _updateProgress() {
  //   const oneSec = Duration(seconds: 1);
  //   Timer.periodic(oneSec, (Timer t) {
  //     setState(() {});
  //   });
  // }
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                color: Colors.white,
                thickness: 10,
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
                color: Colors.white,
                thickness: 10,
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
