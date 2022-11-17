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

    _onTeacherDeleted(Teacher teacher) {
      Navigator.pop(context);
      teacherNotifier.deleteTeacher(teacher);
    }

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
                  builder: (BuildContext context) => const Professors(),
                ),
              );
            }),
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.network(
                    teacherNotifier.currentTeacher.image,
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    teacherNotifier.currentTeacher.name,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Description: ${teacherNotifier.currentTeacher.category}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'phone: ${teacherNotifier.currentTeacher.phone}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Email: ${teacherNotifier.currentTeacher.email}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Address: ${teacherNotifier.currentTeacher.address}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Skills",
                    style: TextStyle(
                        fontSize: 18, decoration: TextDecoration.underline),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8),
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: teacherNotifier.currentTeacher.subIngredients
                        .map(
                          (ingredient) => Card(
                            color: Colors.black54,
                            child: Center(
                              child: Text(
                                ingredient,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  //   Text(widget.data['name']),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'button1',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const TeacherForm(
                    isUpdating: true,
                  );
                }),
              );
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'button2',
            onPressed: () => deleteTeacher(
                teacherNotifier.currentTeacher, _onTeacherDeleted),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
