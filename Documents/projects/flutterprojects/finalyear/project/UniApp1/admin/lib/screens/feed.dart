// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

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

    FirebaseFirestore.instance
        .collection("Teachers")
        .orderBy("name", descending: false)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    TeacherNotifier teacherNotifier = Provider.of<TeacherNotifier>(context);

    Future<void> _refreshList() async {
      getTeachers(teacherNotifier);
    }

    String name = "";
    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Professors(),
                ),
              );
            }),
        title: const Text(
          "List of Professors",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.withOpacity(0.5),
      ),
      body: Column(
        children: [
          // RefreshIndicator(
          //     onRefresh: _refreshList,
          //     child: ListView.separated(
          //       itemBuilder: (BuildContext context, int index) {
          //         return ListTile(
          //           leading: Image.network(
          //             teacherNotifier.teacherList[index].image,
          //             width: 120,
          //             fit: BoxFit.fitWidth,
          //           ),
          //           title: Text(teacherNotifier.teacherList[index].name),
          //           subtitle: Text(teacherNotifier.teacherList[index].category),
          //           onTap: () {
          //             teacherNotifier.currentTeacher =
          //                 teacherNotifier.teacherList[index];
          //             Navigator.of(context)
          //                 .push(MaterialPageRoute(builder: (BuildContext context) {
          //               return const FoodDetail();
          //             }));
          //           },
          //         );
          //       },
          //       itemCount: teacherNotifier.teacherList.length,
          //       separatorBuilder: (BuildContext context, int index) {
          //         return const Divider(
          //           color: Colors.black,
          //         );
          //       },
          //     ),
          //   ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search by name',
                ),
                onChanged: (val) {
                  setState(() {
                    name = val.trim().toUpperCase();
                  });
                },
              ),
            ),
          ),

          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              // ignore: unnecessary_null_comparison
              stream: (name != "" && name != null)
                  ? FirebaseFirestore.instance
                      .collection('Teachers')
                      .where("name", isEqualTo: name)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection("Teachers")
                      .orderBy("name", descending: false)
                      .snapshots(),
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                        color: Colors.green.withOpacity(0.5),
                      ))
                    : ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return Card(
                            elevation: 0,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodDetail(data: data)),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        data['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${data['email']}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        data['phone'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                        softWrap: true,
                                        //overflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),
                                ) // Text("k"),
                              ],
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
