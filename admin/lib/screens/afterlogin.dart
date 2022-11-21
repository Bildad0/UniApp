// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'package:admin/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';
import '/calendar_folder/model/screens/event_creator.dart';

import '/screens/fees.dart';
import '/screens/mygallery/mygallery.dart';
import '/screens/professors.dart';
import '/screens/students.dart';
// import 'package:food/screens/teacher_form.dart';
import 'package:flutter/material.dart';
import '/screens/search.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({super.key});

  @override
  _AfterLoginState createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  MyUser user = MyUser();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    void _signOut() async {
      try {
        await auth.signOut();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "UniApp",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(0),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.red.withOpacity(0.2)),
                  foregroundColor: const MaterialStatePropertyAll(Colors.red)),
              onPressed: _signOut,
              child: const Text("Logout"),
            ),
          ],
        ),
        centerTitle: true,
        //actions: const [],
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/school.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
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
                    children: [
                      Card(
                        color: Colors.blueGrey.withOpacity(0.5),
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
                                          const Professors(),
                                    ),
                                  );
                                }),
                            const Text("Professors",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.green.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.book),
                                color: Colors.white,
                                iconSize: 20,
                                //highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const CloudFirestoreSearch(),
                                    ),
                                  );
                                }),
                            const Text("Edit Students",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Card(
                        color: const Color.fromARGB(255, 207, 195, 199)
                            .withOpacity(0.5),
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
                                          const Students(),
                                    ),
                                  );
                                }),
                            const Text("Students",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.blueAccent.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.money),
                                color: Colors.white,
                                iconSize: 20,
                                //highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Fees(),
                                    ),
                                  );
                                }),
                            const Text("Fee",
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
                                icon: const Icon(Icons.image),
                                color: Colors.white,
                                iconSize: 20,
                                // highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const MyGallery(),
                                    ),
                                  );
                                }),
                            const Text("Files",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.brown.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.list),
                                color: Colors.white,
                                iconSize: 20,
                                //highlightColor: Colors.pink,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const EventCreator(),
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
