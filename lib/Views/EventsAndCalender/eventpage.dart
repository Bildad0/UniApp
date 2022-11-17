// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../widgets/events.dart';
import 'package:intl/intl.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  EventPageState createState() {
    return EventPageState();
  }
}

class EventPageState extends State<EventPage> {
  //getting current dateand formating as expected
  var year = DateFormat('y').format(DateTime.now());
  var month = DateFormat('MMM').format(DateTime.now());
  var date = DateTime.now().day;
//end
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
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFF0F0F0),
          title: Center(
            child: Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Text(
                  "$date / $month / $year Events",
                  style: const TextStyle(
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
