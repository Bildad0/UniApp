import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher {
  late String id;
  late String name;
  late String category;
  late String image;
  late String address;
  late String phone;
  late String email;
  late List subIngredients = [];
  late Timestamp createdAt;
  late Timestamp updatedAt;

  Teacher();

  Teacher.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
    address = data['address'];
    phone = data['phone'];
    email = data['email'];
    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'address': address,
      'phone': phone,
      'email': email,
      'subIngredients': subIngredients,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}

class Course {
  late String id;
  late String name;
  late String description;
  late String image;
  late String instructor;
  late Timestamp createdAt;
  late Timestamp updatedAt;

  Course();

  Course.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    description = data['description'];
    image = data['image'];
    instructor = data['instructor'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'instructor': instructor,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}

class Fee {
  late String id;
  late String className;
  late String fee;

  late Timestamp createdAt;
  late Timestamp updatedAt;
  Fee();

  Fee.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    className = data['className'];
    fee = data['fee'];

    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'className': className,
      'fee': fee,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}

class Student {
  late String id;
  late String rollNo;
  late String name;
  late String fName;
  late String image;
  late String address;
  late String phone;
  late String registrationNo;

  late Timestamp createdAt;
  late Timestamp updatedAt;

  Student();

  Student.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    rollNo = data['rollNo'];
    name = data['name'];
    fName = data['fName'];
    image = data['image'];
    address = data['address'];
    phone = data['phone'];
    registrationNo = data['registrationNo'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rollNo': rollNo,
      'name': name,
      'fName': fName,
      'image': image,
      'address': address,
      'phone': phone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'registrationNo': registrationNo,
    };
  }
}
