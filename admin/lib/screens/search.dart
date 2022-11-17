import '/model/allmodels.dart';
import '/screens/detail.dart';
import '/screens/studentsearchresult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'afterlogin.dart';

late Student myuser;

class CloudFirestoreSearch extends StatefulWidget {
  const CloudFirestoreSearch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.brown,
        title: const Text("Search Students"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            color: Colors.brown,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: TextField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search by registration no'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: (name != "" && name != null)
                  ? FirebaseFirestore.instance
                      .collection('Students')
                      .where("registrationNo", isEqualTo: name)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection("Students")
                      .snapshots(),
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return Card(
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StudentSearchResult(data: data)),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        data['registrationNo'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
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
