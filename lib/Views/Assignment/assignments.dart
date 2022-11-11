import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:path_provider/path_provider.dart';

class AssignmentsPage extends StatefulWidget {
  const AssignmentsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AssignmentsPageState createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {
  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => {
                  Navigator.pop(context),
                },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.green,
            )),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            if (result != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selected file:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: result.files.length,
                        itemBuilder: (context, index) {
                          return Text(result?.files[index].name ?? '',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold));
                        })
                  ],
                ),
              ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Upload File..."),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () async {
                        result = await FilePicker.platform
                            .pickFiles(allowMultiple: true);
                        if (result != null) {
                          setState(() {
                            result;
                          });
                          result?.files.forEach((element) {
                            uploadFile(element.name);
                            // Navigator.pop(context);
                          });
                        }
                      },
                      child: const Icon(Icons.upload_file_sharp))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void uploadFile(String name) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String filePath = '${appDocDir.absolute}/$name';
  File file = File(filePath);
  final metadata = SettableMetadata(contentType: "file/pdf");
  final storageRef = FirebaseStorage.instance.ref();

  final uploadTask =
      storageRef.child("Notes/Assignments/$name").putFile(file, metadata);

  uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
    switch (taskSnapshot.state) {
      case TaskState.running:
        final progress =
            100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
        print("Upload is $progress% complete.");
        break;
      case TaskState.paused:
        print("Upload is paused.");
        break;
      case TaskState.canceled:
        print("Upload was canceled");
        break;
      case TaskState.error:
        // Handle unsuccessful uploads
        break;
      case TaskState.success:
        // Handle successful uploads on complete
        break;
    }
  });
}
