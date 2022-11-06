import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../widgets/events.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  EventPageState createState() {
    return EventPageState();
  }
}

class EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => {Navigator.pop(context)},
                    child:
                        const Icon(Icons.arrow_back, color: Color(0XFF343E87)),
                  ),
                ],
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFF0F0F0),
          title: Center(
            child: Row(
              children: const [
                SizedBox(
                  width: 50,
                ),
                Text(
                  "Today's Events",
                  style: TextStyle(
                      color: Color(0XFF343E87),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
      body: const EventWidget(),
    );
  }
}
