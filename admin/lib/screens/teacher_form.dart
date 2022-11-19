// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:io';

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
  late String _imageUrl;
  Teacher? teacher;
  late File _imageFile;
  TextEditingController subingredientController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final TeacherNotifier teacherNotifier =
        Provider.of<TeacherNotifier>(context, listen: false);
    if (teacherNotifier.currentTeacher == null) {
      teacher = Teacher();
    } else {
      teacher = teacherNotifier.currentTeacher;
    }

    _subingredients.addAll(teacher!.subIngredients);
    _imageUrl = teacher!.image;
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
      children: <Widget>[
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
      decoration: InputDecoration(
        labelText: 'Name',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: teacher?.name,
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
        teacher?.name = value!;
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: teacher?.phone,
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
        teacher?.phone = value!;
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
      initialValue: teacher?.address,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value != null) {
          if (value.length < 3 || value.length > 20) {
            return 'Address must be more than 3 and less than 20';
          }
          return null;
        }

        return 'Addressis required';
      },
      onSaved: (value) {
        teacher?.address = value!;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: teacher?.email,
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
        teacher?.email = value!;
      },
    );
  }

  Widget _buildCategoryField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Description',
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        contentPadding: const EdgeInsets.all(3),
      ),
      initialValue: teacher?.category,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      validator: (value) {
        if (value != null) {
          if (value.isEmpty || value.length > 20) {
            return 'description must be more than 3 and less than 20';
          }

          return 'description is required';
        }

        return null;
      },
      onSaved: (value) {
        teacher?.category = value!;
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Professors(),
      ),
    );
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
    print('saveteacher Called');
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState?.save();

    print('form saved');

    teacher?.subIngredients = _subingredients;

    uploadTeacherAndImage(
        teacher!, widget.isUpdating, _imageFile, _onTeacherUploaded);

    print("name: ${teacher?.name}");
    print("email: ${teacher?.email}");
    print("phone: ${teacher?.phone}");
    print("address: ${teacher?.address}");

    print("category: ${teacher?.category}");
    print("subingredients: ${teacher?.subIngredients.toString()}");
    print("_imageFile ${_imageFile.toString()}");
    print("_imageUrl $_imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    TeacherNotifier teacherNotifier = Provider.of<TeacherNotifier>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Professors(),
                ),
              );
            }),
        title: const Text("Professors"),
        centerTitle: true,
        backgroundColor: Colors.brown,
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
                              style: TextStyle(
                                  fontSize: 30, color: Colors.brown[400]),
                            ),
                            const SizedBox(height: 12),
                            _imageFile == null && _imageUrl == null
                                ? ButtonTheme(
                                    child: ElevatedButton(
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
          teacherNotifier.currentTeacher;
          _saveTeacher();
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown[400],
        child: const Icon(Icons.save),
      ),
    );
  }
}
