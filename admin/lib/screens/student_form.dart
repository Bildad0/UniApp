// ignore_for_file: unnecessary_null_comparison, avoid_print, library_private_types_in_public_api

import 'dart:io';

import '/api/student_api.dart';
import '/model/allmodels.dart';
import '/notifier/student_notifier.dart';
import '/screens/students.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class StudentForm extends StatefulWidget {
  final bool isUpdating;

  const StudentForm({super.key, required this.isUpdating});

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Student? _currentStudent;
  late String _imageUrl;
  late File _imageFile;

  @override
  void initState() {
    super.initState();
    StudentNotifier studentNotifier =
        Provider.of<StudentNotifier>(context, listen: false);
    late Student currentStudent = Student();
    if (studentNotifier.currentStudent != null) {
      _currentStudent = studentNotifier.currentStudent;
    } else {
      _currentStudent = currentStudent;
    }

    _imageUrl = _currentStudent!.image;
  }

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return const Text("");
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.file(
            _imageFile,
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
          _imageUrl,
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
      decoration: InputDecoration(
        labelText: 'Enter Name',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: _currentStudent!.name,
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
        _currentStudent!.name = value!;
      },
    );
  } // _buildRollNoField()

  Widget _buildRollNoField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter Roll Number',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: _currentStudent!.rollNo,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value == null) {
          return 'Roll number is required';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent!.rollNo = value!;
      },
    );
  }

  Widget _buildRegisterationNoField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter Registration Number',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: _currentStudent!.registrationNo,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value == null) {
          return 'Registration number is required';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent!.registrationNo = value!;
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter Phone Number',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: _currentStudent!.phone,
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
        _currentStudent!.phone = value!;
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Address',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: _currentStudent!.address,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15),
      validator: (value) {
        if (value == null) {
          return 'Address is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Address must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent!.address = value!;
      },
    );
  }

  Widget _buildfNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter  Father name',
        fillColor: Colors.white10,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: _currentStudent!.fName,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value == null) {
          return 'Father name is required';
        }

        if (value.length < 3 || value.length > 20) {
          return 'Father name must be more than 3 and less than 20';
        }

        return null;
      },
      onSaved: (value) {
        _currentStudent!.fName = value!;
      },
    );
  }

  _onStudentUploaded(Student student) {
    StudentNotifier studentNotifier =
        Provider.of<StudentNotifier>(context, listen: false);
    studentNotifier.addStudent(student);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Students(),
      ),
    );
  }

  _saveStudent() {
    print('saveStudent Called');
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    print('form saved');

    uploadStudentAndImage(
        _currentStudent!, widget.isUpdating, _imageFile, _onStudentUploaded);

    print("name: ${_currentStudent!.name}");

    print("phone: ${_currentStudent!.phone}");
    print("address: ${_currentStudent!.address}");

    print("category: ${_currentStudent!.fName}");

    print("_imageFile ${_imageFile.toString()}");
    print("_imageUrl $_imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    StudentNotifier studentNotifier = Provider.of<StudentNotifier>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Students(),
                ),
              );
            }),
        title: const Text("Add Students"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                        child: Column(
                      children: <Widget>[
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
          studentNotifier.currentStudent;

          _saveStudent();
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown[400],
        child: const Icon(Icons.save),
      ),
    );
  }
}
