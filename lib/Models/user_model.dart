import 'dart:convert';

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
  static fromJson(json) {
    //returns body from firebase api call
  }
}
