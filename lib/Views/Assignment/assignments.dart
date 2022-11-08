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
          children: const [Text("Hi")],
        ),
      ),
    );
  }
}
