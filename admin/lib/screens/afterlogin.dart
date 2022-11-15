import '/calendar_folder/model/screens/event_creator.dart';

import '/screens/fees.dart';
import '/screens/mygallery/mygallery.dart';
import '/screens/professors.dart';
import '/screens/students.dart';
// import 'package:food/screens/teacher_form.dart';
import 'package:flutter/material.dart';
import '/screens/search.dart';

class AfterLogin extends StatefulWidget {
  @override
  _AfterLoginState createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UniApp"),
        centerTitle: true,
        actions: <Widget>[],
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/school.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: [
            Flexible(
              child: LayoutBuilder(
                builder: (context, constaint) {
                  return GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: <Widget>[
                      Container(
                        child: Card(
                          color: Colors.red[400],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                  icon: const Icon(Icons.person_add),
                                  color: Colors.white,
                                  iconSize: 40,
                                  highlightColor: Colors.pink,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Professors(),
                                      ),
                                    );
                                  }),
                              const Text("Professors",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.green[400],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.book),
                                color: Colors.white,
                                iconSize: 40,
                                highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CloudFirestoreSearch(),
                                    ),
                                  );
                                }),
                            const Text("Search students",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.pink[400],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.person_add),
                                color: Colors.white,
                                iconSize: 40,
                                highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Students(),
                                    ),
                                  );
                                }),
                            const Text("Students",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.money),
                                color: Colors.white,
                                iconSize: 40,
                                highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => Fees(),
                                    ),
                                  );
                                }),
                            const Text("Fee",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.blue[400],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.image),
                                color: Colors.white,
                                iconSize: 40,
                                highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyGallery(),
                                    ),
                                  );
                                }),
                            const Text("Media Gallery",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.brown[400],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.list),
                                color: Colors.white,
                                iconSize: 40,
                                highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EventCreator(),
                                    ),
                                  );
                                }),
                            const Text("Events",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
