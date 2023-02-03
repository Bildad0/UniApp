// ignore_for_file: library_private_types_in_public_api

import '/screens/afterlogin.dart';
import '/screens/mygallery/uploadImages.dart';
import '/screens/mygallery/viewImages.dart';
import 'package:flutter/material.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  final _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 20,
              //highlightColor: Colors.pink,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const AfterLogin(),
                  ),
                );
              }),
          title: const Text('Files'),
          backgroundColor: Colors.green.withOpacity(0.5),
          foregroundColor: Colors.white,
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.file_open),
                text: 'Files',
              ),
              Tab(
                icon: Icon(Icons.cloud_upload),
                text: "Upload Files",
              ),
            ],
            indicatorColor: Colors.green,
            indicatorWeight: 5.0,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Text("view"),
            //Text("upload"),
            ViewImages(),
            UploadImages(
              globalKey: _globalKey,
            ),
          ],
        ),
      ),
    );
  }
}
