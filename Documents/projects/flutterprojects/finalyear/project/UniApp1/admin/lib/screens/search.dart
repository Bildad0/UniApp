import '/model/allmodels.dart';
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
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AfterLogin()));
            }),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.withOpacity(0.5),
        title: const Text(
          "Students",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: TextField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.search), hintText: 'Search by name'),
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
                      .collection('Students')
                      .where("name", isEqualTo: name)
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection("Students")
                      .orderBy("name", descending: false)
                      .snapshots(),
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(child: CircularProgressIndicator())
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
                                            StudentSearchResult(data: data)),
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
                                        data['fName'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        "${data['registrationNo']}",
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
