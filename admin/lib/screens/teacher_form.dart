// ignore_for_file: unnecessary_null_comparison, avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import '/api/teacher_api.dart';
import '/model/allmodels.dart';
import '/notifier/teacher_notifier.dart';
import 'package:flutter/material.dart';
import '/screens/professors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class TeacherForm extends StatefulWidget {
  final bool isUpdating;

  const TeacherForm({super.key, required this.isUpdating});

  @override
  // ignore: library_private_types_in_public_api
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List _subingredients = [];
  String? _imageUrl;
  Teacher teacher = Teacher();
  File? _imageFile;
  TextEditingController subingredientController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

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
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 400,
        requestFullMetadata: true);

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
        labelText: 'Name',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: teacher.name,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value != null) {
          if (value.length < 3 || value.length > 20) {
            return 'Name must be more than 3 and less than 20';
          }
          return null;
        }

        return 'Name is required';
      },
      onSaved: (value) {
        teacher.name = nameController.text.trim();
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: phoneController,
      decoration: InputDecoration(
        labelText: 'Phone',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: teacher.phone,
      keyboardType: TextInputType.text,
      maxLength: 13,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value != null) {
          if (value.length < 13) {
            return 'Phone must be 13';
          }
          return null;
        }

        return 'Phone is required';
      },
      onSaved: (value) {
        teacher.phone = phoneController.text.trim();
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: addressController,
      decoration: InputDecoration(
        labelText: 'Address',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: teacher.address,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value != null) {
          if (value.length < 3 || value.length > 20) {
            return 'Address must be more than 3 and less than 20';
          }
          return null;
        }

        return 'Address is required';
      },
      onSaved: (value) {
        teacher.address = addressController.text.trim();
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: teacher.email,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (val) {
        return RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!)
            ? null
            : "Please Enter Correct Email";
      },
      onSaved: (value) {
        teacher.email = emailController.text.trim();
      },
    );
  }

  Widget _buildCategoryField() {
    return TextFormField(
      controller: descController,
      decoration: InputDecoration(
        labelText: 'Description',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      //initialValue: teacher.category,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value != null) {
          if (value.isEmpty || value.length > 20) {
            return 'description must be more than 3 and less than 20';
          }
          return null;
        }

        return 'description is required';
      },
      onSaved: (value) {
        teacher.category = descController.text.trim();
      },
    );
  }

  _buildSubingredientField() {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: subingredientController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Skills',
          fillColor: Colors.white10,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          contentPadding: const EdgeInsets.all(3),
        ),
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  _onTeacherUploaded(Teacher teacher) {
    TeacherNotifier teacherNotifier =
        Provider.of<TeacherNotifier>(context, listen: false);
    teacherNotifier.addTeacher(teacher);
  }

  _addSubingredient(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _subingredients.add(text);
      });
      subingredientController.clear();
    }
  }

  _saveTeacher() {
    print('save teacher Called');
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState?.save();

    print('form saved');

    //teacher.subIngredients = _subingredients;

    // uploadTeacherAndImage(
    //     teacher, widget.isUpdating, _imageFile!, _onTeacherUploaded);
    print("Sending to firebase");
    FirebaseFirestore.instance.collection('Teachers').doc().set({
      'address': addressController.text.trim(),
      'email': emailController.text.trim(),
      'category': descController.text.trim(),
      //'image': teacher.image,
      'createdAt': DateTime.now(),
      'name': nameController.text.trim().toUpperCase(),
      'phone': phoneController.text.trim(),
      'subIngridients': subingredientController.text.trim(),
      'updatedAt': DateTime.now(),
    });

    print("name: ${nameController.text}");
    print("email: ${emailController.text}");
    print("phone: ${teacher.phone}");
    print("address: ${addressController.text}");

    print("category: ${descController.text}");
    print("subingredients: ${subingredientController.text}");
    print("_imageFile ${_imageFile.toString()}");
    print("_imageUrl $_imageUrl");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Professors(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            //highlightColor: Colors.pink,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Professors(),
                ),
              );
            }),
        title: const Text(
          "Professors",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.withOpacity(0.5),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            _showImage(),
                            const SizedBox(height: 16),
                            Text(
                              widget.isUpdating
                                  ? "Edit Professor"
                                  : "Add Teachers",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.black),
                            ),
                            const SizedBox(height: 12),
                            _imageFile == null && _imageUrl == null
                                ? ButtonTheme(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(Colors
                                                  .green
                                                  .withOpacity(0.5)),
                                          foregroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.white)),
                                      onPressed: () => _getLocalImage(),
                                      child: const Text(
                                        'Add Image',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                : const SizedBox(height: 0),
                            _buildNameField(),
                            const SizedBox(height: 10),
                            _buildCategoryField(),
                            const SizedBox(height: 10),
                            _buildEmailField(),
                            const SizedBox(height: 10),
                            _buildAddressField(),
                            const SizedBox(height: 10),
                            _buildPhoneField(),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                _buildSubingredientField(),
                                ButtonTheme(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.green.withOpacity(0.5)),
                                        foregroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.white)),
                                    child: const Text('Add',
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () => _addSubingredient(
                                        subingredientController.text),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            GridView.count(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(8),
                              crossAxisCount: 3,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              children: _subingredients
                                  .map(
                                    (ingredient) => Card(
                                      color: Colors.black54,
                                      child: Center(
                                        child: Text(
                                          ingredient,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          ],
                        )),
                  ],
                )),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //teacherNotifier.currentTeacher;
          _saveTeacher();
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Icon(Icons.save),
            Text("Save"),
          ],
        ),
      ),
    );
  }
}
