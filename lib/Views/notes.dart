import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Hi this page is about your notes"),
      ],
    );
  }
}
