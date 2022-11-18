import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '/notifier/auth_notifier.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '/screens/afterlogin.dart';
import 'package:intl/intl.dart';

final AuthNotifier _auth = AuthNotifier();

class EventData {
  String title = '';
  late DateTime time;
  String summary = '';
}

class EventCreator extends StatefulWidget {
  const EventCreator({super.key});

  @override
  State<StatefulWidget> createState() {
    return EventCreatorState();
  }
}

class EventCreatorState extends State<EventCreator> {
  late DateTime _dateTime;
  final dateFormat = DateFormat("MMMM d, yyyy 'at' h:mma");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EventData _eventData = EventData();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    final titleWidget = new TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Event Name',
          labelText: 'Event Title',
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
      style: Theme.of(context).textTheme.bodyText1,
      validator: _validateTitle(_titleController.text),
      onSaved: (value) => _eventData.title = _titleController.text,
    );

    final notesWidget = TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      decoration: InputDecoration(
          hintText: 'Detail',
          labelText: 'Enter detail here',
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
      style: Theme.of(context).textTheme.headline1,
      onSaved: (value) => _eventData.summary = _notesControler.text,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AfterLogin(),
                ),
              );
            }),
        title: const Text('Create New Event'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: const Text(
                'SAVE',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () => _saveNewEvent(context),
            ),
          ),
          const SizedBox(height: 16.0),
          //notesWidget,
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  titleWidget,
                  const SizedBox(height: 16.0),
                  FormBuilderDateTimePicker(
                    name: "date",
                    initialValue: DateTime.now(),
                    initialDate: DateTime.now(),
                    fieldHintText: "Add Date",
                    initialDatePickerMode: DatePickerMode.day,
                    inputType: InputType.date,
                    format: DateFormat('EEEE, dd MMMM, yyyy'),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.calendar_today_sharp),
                    ),
                    validator: _validateDate(_dateTime),
                    onSaved: (value) => {_eventData.time = _dateTime},
                  ),
                  notesWidget,
                  const SizedBox(height: 16.0),
                  IconButton(
                      icon: const Icon(Icons.save),
                      color: Colors.black,
                      iconSize: 40,
                      highlightColor: Colors.pink,
                      onPressed: () {
                        _saveNewEvent(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AfterLogin()),
                        );
                      }),
                ],
              ),
            )),
      ),
    );
  }

  _validateTitle(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid title.';
    } else {
      return null;
    }
  }

  _validateDate(DateTime value) {
    if ((value != null) &&
        (value.day >= 1 && value.day <= 31) &&
        (value.month >= 1 && value.month <= 12) &&
        (value.year >= 2015 && value.year <= 3000)) {
      return null;
    } else {
      return 'Please enter a valid event date.';
    }
  }

  Future _saveNewEvent(BuildContext context) async {
    User? currentUser = _auth.currentUser;
    print('current user: $currentUser');

    if (currentUser != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save(); // Save our form now.

      FirebaseFirestore.instance.collection('calendar_events').doc().set({
        'name': _eventData.title,
        'summary': _eventData.summary,
        'time': _eventData.time,
        'email': currentUser.email
      });
    } else {
      print('Error validating data and saving to firestore.');
    }
  }
}
