import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


final storage = FirebaseStorage.instance;



DatabaseReference ref = FirebaseDatabase.instance.ref();


// await ref.set({
//   "name": "John",
//   "age": 18,
//   "address": {
//     "line1": "100 Mountain View"
//   }
// });

class UserData {
  // factory Students.fromReqBody(String body) {
  //   Map<String, dynamic> json = jsonDecode(body);
  //   return Students(
  //     json['student_id'],
  //     json['student_email'],
  //     json['student_name'],
  //     json['student_course_id'],
  //     json['student_year_of_study'],
  //   );
  // }
  // static fromJson(json) {
  //   //returns body from firebase api call
  // }
}
