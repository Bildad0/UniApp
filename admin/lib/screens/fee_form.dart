// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'dart:io';

import '/api/fee_api.dart';

import '/api/teacher_api.dart';
import '/model/allmodels.dart';
import '/notifier/fee_notifier.dart';
import '/notifier/teacher_notifier.dart';
import '/screens/fees.dart';
import 'package:flutter/material.dart';
import '/screens/afterlogin.dart';

import 'package:provider/provider.dart';

class FeeForm extends StatefulWidget {
  final bool isUpdating;

  const FeeForm({super.key, required this.isUpdating});

  @override
  _FeeFormState createState() => _FeeFormState();
}

class _FeeFormState extends State<FeeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late Fee _currentFee;

  // @override
  // void initState() {
  //   super.initState();
  //   FeeNotifier feeNotifier = Provider.of<FeeNotifier>(context, listen: false);

  //   if (feeNotifier.currentFee != null) {
  //     _currentFee = feeNotifier.currentFee;
  //   } else {
  //     _currentFee = Fee();
  //   }
  // }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter class",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      //initialValue: _currentFee.className,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
        _currentFee.className = value!;
      },
    );
  }

  Widget _buildFeeField() {
    return TextFormField(
      //initialValue: _currentFee.fee,
      keyboardType: TextInputType.text,
      // maxLength: 50,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Fee",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),

      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      validator: (value) {
        if (value == null) {
          return 'fee is required';
        }

        return null;
      },
      onSaved: (value) {
        _currentFee.fee = value!;
      },
    );
  }

  _onFeeUploaded(Fee fee) {
    FeeNotifier feeNotifier = Provider.of<FeeNotifier>(context, listen: false);
    feeNotifier.addFee(fee);
  }

  _saveFee() {
    print('fee Called');
    if (!_formKey.currentState!.validate()) {}

    _formKey.currentState?.save();

    print('form saved');

    uploadFeeAndImage(_currentFee, widget.isUpdating, _onFeeUploaded);

    print("name: ${_currentFee.className}");
    print("category: ${_currentFee.fee}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.green,
            iconSize: 40,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Fees(),
                ),
              );
            }),
        title: const Text("Add Fee"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/school.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(children: <Widget>[
                const SizedBox(height: 16),
                Text(
                  widget.isUpdating ? "Edit Fee" : "Create Fee",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildNameField(),
                const SizedBox(height: 16),
                _buildFeeField(),
                const SizedBox(height: 16),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _saveFee();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AfterLogin(),
            ),
          );
        },
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        child: const Icon(Icons.save),
      ),
    );
  }
}
