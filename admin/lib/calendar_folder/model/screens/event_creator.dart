// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '/screens/afterlogin.dart';
import 'package:intl/intl.dart';

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
  // late DateTime _dateTime;
  final dateFormat = DateFormat("d,MMM,yyyy 'at' h:mm a");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EventData _eventData = EventData();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesControler = TextEditingController();
  final TextEditingController _dateControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    final titleWidget = TextFormField(
        keyboardType: TextInputType.text,
        controller: _titleController,
        decoration: InputDecoration(
            hintText: 'Event Name',
            labelText: 'Event Title',
            contentPadding: const EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
        style: Theme.of(context).textTheme.bodyText1,
        validator: _validateTitle(_eventData.title),
        onSaved: (value) {
          _eventData.title = _titleController.text;
        });

    final notesWidget = TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        controller: _notesControler,
        decoration: InputDecoration(
            hintText: 'Detail',
            labelText: 'Enter detail here',
            contentPadding: const EdgeInsets.all(16.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        style: Theme.of(context).textTheme.headline1,
        onSaved: (value) {
          _eventData.summary = _notesControler.text;
        });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.green,
            iconSize: 40,
            //highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AfterLogin(),
                ),
              );
            }),
        title: const Text(
          'Create New Event',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
                child: const Text(
                  'SAVE',
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  _saveNewEvent();
                }),
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
                children: [
                  titleWidget,
                  const SizedBox(height: 16.0),
                  FormBuilderDateTimePicker(
                    name: "date",
                    controller: _dateControler,
                    initialValue: DateTime.now(),
                    initialDate: DateTime.now(),
                    fieldHintText: "Add Date",
                    //format: dateFormat,
                    initialDatePickerMode: DatePickerMode.day,
                    inputType: InputType.date,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.calendar_today_sharp),
                    ),
                    validator:
                        _validateDate(dateFormat.parse(_dateControler.text)),
                    onSaved: (value) => {
                      _eventData.time = dateFormat.parse(_dateControler.text),
                    },
                  ),
                  notesWidget,
                  const SizedBox(height: 16.0),
                  IconButton(
                      icon: const Icon(Icons.save),
                      color: Colors.black,
                      iconSize: 40,
                      //highlightColor: Colors.pink,
                      onPressed: () {
                        _saveNewEvent();
                      }),
                ],
              ),
            )),
      ),
    );
  }

  _validateTitle(value) {
    if (value == null) {
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

  Future _saveNewEvent() async {
    // User? currentUser = _auth.currentUser;
    //print('current user: $currentUser');

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save(); // Save our form now.

      FirebaseFirestore.instance.collection('Event').doc().set({
        'name': _titleController.text,
        'summary': _notesControler.text,
        'time': dateFormat.parse(_dateControler.text, true),
        'email': "Admin@gmail.com"
      });
      return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          content: const Text(
            'Successful',
            style: TextStyle(color: Colors.green),
          ),
          actions: [
            CupertinoDialogAction(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Event ${_titleController.text} created successfully"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                        elevation: MaterialStatePropertyAll(0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('Ok'.toUpperCase()),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          content: const Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          actions: [
            CupertinoDialogAction(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        "Error validating data and saving to firestore."),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                        elevation: MaterialStatePropertyAll(0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('Ok'.toUpperCase()),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
