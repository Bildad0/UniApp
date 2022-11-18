import 'dart:collection';

import '/model/allmodels.dart';
import 'package:flutter/cupertino.dart';

class StudentNotifier with ChangeNotifier {
  List<Student> _studentList = [];
  late Student _currentStudent;

  UnmodifiableListView<Student> get studentList =>
      UnmodifiableListView(_studentList);

  Student get currentStudent => _currentStudent;

  set studentList(List<Student> studentList) {
    _studentList = studentList;
    notifyListeners();
  }

  set currentStudent(Student student) {
    _currentStudent = student;
    notifyListeners();
  }

  addStudent(Student student) {
    _studentList.insert(0, student);
    notifyListeners();
  }

  deleteStudent(Student student) {
    // ignore: no_leading_underscores_for_local_identifiers
    _studentList.removeWhere((_student) => _student.id == student.id);
    notifyListeners();
  }
}
