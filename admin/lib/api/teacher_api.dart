// ignore_for_file: deprecated_member_use, invalid_return_type_for_catch_error, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import '/model/allmodels.dart';
import '/model/user.dart';
import '/notifier/auth_notifier.dart';
import '/notifier/teacher_notifier.dart';

login(MyUser user, AuthNotifier authNotifier) async {
  UserCredential authResult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  User? firebaseUser = authResult.user;
  final userid = firebaseUser?.uid;
  final currentUser =
      FirebaseFirestore.instance.collection("user").where("uid=$userid");
  return currentUser;
}

signup(MyUser user, AuthNotifier authNotifier) async {
  UserCredential authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  await FirebaseAuth.instance.currentUser
      ?.updateProfile(displayName: user.displayName);

  User? firebaseUser = authResult.user;

  if (firebaseUser != null) {
    await firebaseUser.updateProfile();

    await firebaseUser.reload();

    User? currentUser = FirebaseAuth.instance.currentUser;
    authNotifier.setUser(currentUser!);
  }
}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance
      .signOut()
      .catchError((error) => print(error.code));

  //authNotifier.setUser();
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  User? firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser != null) {
    authNotifier.setUser(firebaseUser);
  }
}

getTeachers(TeacherNotifier teacherNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Teachers')
      .orderBy("createdAt", descending: true)
      .get();

  List<Teacher> teacherList = [];
  // ignore: unnecessary_null_comparison
  if (snapshot != null) {
    for (int i = 0; i < snapshot.docs.length; i++) {
      Teacher teacher = snapshot.docs as Teacher;
      teacherList.add(teacher);
    }
  } else {
    return "We are having problem loading your Information";
  }

  // List<Teacher> _teacherList = [];

  // snapshot.docs.forEach((document) {
  //   Teacher teacher = Teacher.fromMap(document.data());
  //   _teacherList.add(teacher);
  // });

  teacherNotifier.teacherList = teacherList;
}

uploadTeacherAndImage(Teacher teacher, bool isUpdating, File localFile,
    Function teacherUploaded) async {
  if (localFile != null) {
    var fileExtension = path.extension(localFile.path);

    var uuid = Uuid().v4();

    final Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('teachers/images/$uuid$fileExtension');
    UploadTask uploadTask = firebaseStorageRef.putFile(localFile);
    var imageUrl = await (await uploadTask).ref.getDownloadURL();
    String url = imageUrl.toString();
    // Guardar el post en la bbdd

    _uploadTeacher(teacher, isUpdating, teacherUploaded, imageUrl: url);
  } else {
    _uploadTeacher(teacher, isUpdating, teacherUploaded);
  }
}

_uploadTeacher(Teacher teacher, bool isUpdating, Function teacherUploaded,
    {String? imageUrl}) async {
  CollectionReference teacherRef =
      FirebaseFirestore.instance.collection('Teachers');

  if (imageUrl != null) {
    teacher.image = imageUrl;
  }

  if (isUpdating) {
    teacher.updatedAt = Timestamp.now();

    await teacherRef.doc(teacher.id).update(teacher.toMap());

    teacherUploaded(teacher);
  } else {
    teacher.createdAt = Timestamp.now();

    DocumentReference documentRef = await teacherRef.add(teacher.toMap());

    teacher.id = documentRef.id;

    await documentRef.set(teacher.toMap(), SetOptions(merge: true));

    teacherUploaded(teacher);
  }
}

deleteTeacher(Teacher teacher, Function teacherDeleted) async {
  Reference storageReference =
      FirebaseStorage.instance.refFromURL(teacher.image);

  // print(storageReference.path);

  await storageReference.delete();

  await FirebaseFirestore.instance
      .collection('Teachers')
      .doc(teacher.id)
      .delete();
  teacherDeleted(teacher);
}
