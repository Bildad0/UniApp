import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:uniapp/EditProfile/edit_profile.dart';

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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFFD4E7FE),
                        Color(0xFFF0F0F0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.6, 0.3]),
                ),
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
                                "Resent Accessed Courses",
                                style: TextStyle(
                                  fontSize: 15,
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
          SizedBox(
            height: 100,
            width: 400,
            child: Card(
              shadowColor: const Color.fromARGB(255, 177, 195, 226),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                  color: Color.fromARGB(255, 148, 148, 194),
                ),
              ),
              child: SizedBox(
                width: 200,
                height: 80,
                child: Column(
                  children: [
                    const Text("Computer Architecture"),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text("Dr. Hadullo"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const CourseOverview(),
          const SizedBox(
            height: 10,
          ),
          const CourseOverview(),
          const SizedBox(
            height: 10,
          ),
          const CourseOverview(),
          const SizedBox(
            height: 10,
          ),
          const CourseOverview(),
          const Divider(
            color: Colors.black,
          ),
          Row(
            children: const [
              Center(
                child: Text(
                  "Previous Semester Exam Result",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const ExamResult(),
          const SizedBox(
            height: 10,
          ),
          const ExamResult(),
          const SizedBox(
            height: 10,
          ),
          const ExamResult(),
          const SizedBox(
            height: 10,
          ),
          const ExamResult(),
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
              Column(
                children: const [
                  Text("Code"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Title")
                ],
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ),
              Column(
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
    return Center(
      child: Container(
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
            : const Text(
                "View",
                style: TextStyle(fontSize: 25),
              ),
      ),
    );
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
                  Text("Title")
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
