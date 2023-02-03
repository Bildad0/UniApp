import 'dart:collection';

import '/model/allmodels.dart';
import 'package:flutter/cupertino.dart';

class TeacherNotifier with ChangeNotifier {
  List<Teacher> _teacherList = [];
  late Teacher _currentTeacher;
  Teacher get currentTeacher => _currentTeacher;
  UnmodifiableListView<Teacher> get teacherList =>
      UnmodifiableListView(_teacherList);

  set teacherList(List<Teacher> teacherList) {
    _teacherList = teacherList;
    notifyListeners();
  }

  set currentTeacher(Teacher teacher) {
    _currentTeacher = teacher;
    notifyListeners();
  }

  addTeacher(Teacher teacher) {
    _teacherList.insert(0, teacher);
    notifyListeners();
  }

  deleteTeacher(Teacher teacher) {
    _teacherList.removeWhere((teacher) => teacher.id == teacher.id);
    notifyListeners();
  }
}
