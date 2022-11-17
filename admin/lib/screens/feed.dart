// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api, avoid_print

import '/api/teacher_api.dart';
import '/notifier/auth_notifier.dart';
import '/notifier/teacher_notifier.dart';
import '/screens/detail.dart';
import 'package:flutter/material.dart';
import '/screens/professors.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    TeacherNotifier teacherNotifier =
        Provider.of<TeacherNotifier>(context, listen: false);
    getTeachers(teacherNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    TeacherNotifier teacherNotifier = Provider.of<TeacherNotifier>(context);

    Future<void> _refreshList() async {
      getTeachers(teacherNotifier);
    }

    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Professors(),
                ),
              );
            }),
        title: const Text("List of Professors"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshList,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(
                teacherNotifier.teacherList[index].image,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              title: Text(teacherNotifier.teacherList[index].name),
              subtitle: Text(teacherNotifier.teacherList[index].category),
              onTap: () {
                teacherNotifier.currentTeacher =
                    teacherNotifier.teacherList[index];
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const FoodDetail();
                }));
              },
            );
          },
          itemCount: teacherNotifier.teacherList.length,
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
