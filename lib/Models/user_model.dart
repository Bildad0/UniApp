import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_functions/cloud_functions.dart';

final storage = FirebaseStorage.instance;

FirebaseApp secondaryApp = Firebase.app('UniApp');
FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);

DatabaseReference ref = FirebaseDatabase.instance
    .ref('https://uniapp-bacf3-default-rtdb.firebaseio.com/');

class Students {
  final int studentId;
  final String studentEmail;
  final String studentName;
  final String studentCourseId;
  final String studentYearOfStudy;

  Students(this.studentId, this.studentEmail, this.studentName,
      this.studentCourseId, this.studentYearOfStudy);
  factory Students.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    return Students(
      json['student_id'],
      json['student_email'],
      json['student_name'],
      json['student_course_id'],
      json['student_year_of_study'],
    );
  }
  static fromJson(json) async {
    //returns body from firebase api call
   
  }
}
