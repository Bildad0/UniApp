// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables, library_private_types_in_public_api

import '/api/teacher_api.dart';
import '/model/allmodels.dart';
import '/notifier/teacher_notifier.dart';

import 'package:flutter/material.dart';
import '/screens/professors.dart';
import 'package:provider/provider.dart';

import 'teacher_form.dart';

class FoodDetail extends StatefulWidget {
  final data;
  const FoodDetail({super.key, this.data});

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    TeacherNotifier teacherNotifier = Provider.of<TeacherNotifier>(context);

    _onTeacherDeleted(data) {
      Navigator.pop(context);
      teacherNotifier.deleteTeacher(data);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            // highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Professors(),
                ),
              );
            }),
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.withOpacity(0.5),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Text(
                    widget.data['name'],
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Description: ${widget.data['category']}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Phone: ${widget.data['phone']}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Email: ${widget.data['email']}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Address: ${widget.data['address']}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'Edit',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const TeacherForm(
                    isUpdating: true,
                  );
                }),
              );
            },
            backgroundColor: Colors.green.withOpacity(0.5),
            foregroundColor: Colors.white,
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'Delete',
            onPressed: () => deleteTeacher(widget.data, _onTeacherDeleted),
            backgroundColor: Colors.green.withOpacity(0.5),
            foregroundColor: Colors.white,
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
