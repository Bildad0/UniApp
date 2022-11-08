import 'package:file_picker/file_picker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
                child: Column(children: [
              const Text("Upload File..."),
              ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () async {
                    result = await FilePicker.platform
                        .pickFiles(allowMultiple: true);
                    if (result == null) {
                      print("No file selected");
                    } else {
                      setState(() {});
                      result?.files.forEach((element) {
                        print(element.name);
                      });
                    }
                  },
                  child: const Icon(Icons.upload_file_sharp))
            ]))
          ],
        ),
      ),
    );
  }
}
