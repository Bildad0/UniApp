// ignore_for_file: unnecessary_null_comparison, avoid_print, library_private_types_in_public_api

import 'dart:io';

import 'package:admin/screens/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/model/allmodels.dart';
import '/screens/students.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StudentForm extends StatefulWidget {
  final bool isUpdating;

  const StudentForm({super.key, required this.isUpdating});

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regnoController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final Student _currentStudent = Student();
  String? _imageUrl;
  File? _imageFile;

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return const Text("");
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.file(
            _imageFile!,
            fit: BoxFit.cover,
            height: 250,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.black54,
            ),
            child: const Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    } else {
      print('showing image from url');
    }

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.network(
          _imageUrl!,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          height: 250,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.black54,
          ),
          child: const Text(
            'Change Image',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
          ),
          onPressed: () => _getLocalImage(),
        )
      ],
    );
  }

  _getLocalImage() async {
    XFile? imageFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile as File;
      });
    }
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'Enter Name',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: _currentStudent!.name,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value == null) {
          return 'Name is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Name must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent.name = nameController.text.trim();
      },
    );
  } // _buildRollNoField()

  Widget _buildRollNoField() {
    return TextFormField(
      controller: rollNoController,
      decoration: InputDecoration(
        labelText: 'Enter Roll Number',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: _currentStudent.rollNo,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value == null) {
          return 'Roll number is required';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent.rollNo = rollNoController.text.trim();
      },
    );
  }

  Widget _buildRegisterationNoField() {
    return TextFormField(
      controller: regnoController,
      //initialValue: widget.data.data['registrationNo'],
      decoration: InputDecoration(
        labelText: 'Enter Registration Number',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: _currentStudent.registrationNo,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value == null) {
          return 'Registration number is required';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent.registrationNo = regnoController.text.trim();
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: phoneController,
      decoration: InputDecoration(
        labelText: 'Enter Phone Number',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: _currentStudent.phone,
      keyboardType: TextInputType.text,
      maxLength: 13,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value == null) {
          return 'Phone is required';
        }

        if (value.length == 13) {
          return 'phone must be 13';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent.phone = phoneController.text.trim();
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: addressController,
      decoration: InputDecoration(
        labelText: 'Email Address',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: _currentStudent.address,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15),
      validator: (value) {
        if (value == null) {
          return 'Email is required';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      onSaved: (value) {
        _currentStudent.address = addressController.text.trim();
      },
    );
  }

  Widget _buildfNameField() {
    return TextFormField(
      controller: fullNameController,
      decoration: InputDecoration(
        labelText: 'Enter  Full name',
        fillColor: Colors.white10,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value == null) {
          return 'Full name is required';
        }

        if (value.length < 5 || value.length > 20) {
          return 'Full name must be more than 5 and less than 20';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent.fName = fullNameController.text.trim();
      },
    );
  }

  // _onStudentUploaded(Student student) {
  //   StudentNotifier studentNotifier =
  //       Provider.of<StudentNotifier>(context, listen: false);
  //   studentNotifier.addStudent(student);
  // }

  _saveStudent() {
    print('saveStudent Called');
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    print('form saved');

    // uploadStudentAndImage(
    //     _currentStudent, widget.isUpdating, _imageFile!, _onStudentUploaded);

    FirebaseFirestore.instance.collection('Students').doc().set({
      'address': addressController.text.trim(),
      'createdAt': DateTime.now(),
      'fName': fullNameController.text.trim(),
      'name': nameController.text.trim().toUpperCase(),
      'phone': phoneController.text.trim(),
      'registrationNo': regnoController.text.toUpperCase().trim(),
      'rollNo': rollNoController.text.trim(),
      'updatedAt': DateTime.now()
    });

    print("name: ${nameController.text}");

    print("phone: ${phoneController.text}");
    print("address: ${addressController.text}");

    print("Full Name: ${fullNameController.text}");
    print("Registration No: ${regnoController.text}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const CloudFirestoreSearch(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //StudentNotifier studentNotifier = Provider.of<StudentNotifier>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            //highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Students(),
                ),
              );
            }),
        title: Text(
          widget.isUpdating ? "Edit Student" : "Add Student",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[400],
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                _showImage(),
                                const SizedBox(height: 16),
                                Text(
                                  widget.isUpdating
                                      ? "Edit Student Form"
                                      : "Add Student Form",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.brown[400]),
                                ),
                                const SizedBox(height: 12),
                                _imageFile == null && _imageUrl == null
                                    ? ButtonTheme(
                                        child: ElevatedButton(
                                          style: TextButton.styleFrom(
                                            //padding: EdgeInsets.all(16),
                                            backgroundColor: Colors.brown[400],
                                          ),
                                          onPressed: () => _getLocalImage(),
                                          child: const Text(
                                            'Add Image',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(height: 0),

                                //  _buildRegistrationField(),

                                _buildRollNoField(),
                                const SizedBox(height: 10),
                                _buildRegisterationNoField(),
                                const SizedBox(height: 10),
                                _buildNameField(),
                                const SizedBox(height: 10),
                                _buildfNameField(),
                                const SizedBox(height: 10),

                                _buildAddressField(),
                                const SizedBox(height: 10),
                                _buildPhoneField(),

                                //   _buildedu(),
                              ],
                            )),
                      ],
                    ))),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //studentNotifier.currentStudent;
          _saveStudent();
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[400],
        child: const Icon(Icons.save),
      ),
    );
  }
}
