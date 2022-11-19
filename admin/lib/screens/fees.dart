// ignore_for_file: library_private_types_in_public_api

import '/api/fee_api.dart';
import '/notifier/fee_notifier.dart';
import '/screens/fee_form.dart';
import '/screens/view_fee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'afterlogin.dart';

class Fees extends StatefulWidget {
  const Fees({super.key});

  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  @override
  void initState() {
    FeeNotifier feeNotifier = Provider.of<FeeNotifier>(context, listen: false);
    getFee(feeNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FeeNotifier feeNotifier = Provider.of<FeeNotifier>(context);

    Future<void> _refreshList() async {
      getFee(feeNotifier);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 40,
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AfterLogin(),
                ),
              );
            }),
        title: const Text("Fee"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
//body:_children[_currentIndex],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/school.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        children: [
                          Card(
                            color: Colors.deepPurple,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(Icons.person_add),
                                    color: Colors.white,
                                    iconSize: 20,
                                    highlightColor: Colors.pink,
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const FeeForm(
                                                  isUpdating: false,
                                                )),
                                      );
                                    }),
                                const Text("Add Fee",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          Card(
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(Icons.view_column),
                                    color: Colors.white,
                                    iconSize: 20,
                                    highlightColor: Colors.pink,
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const ViewFee(),
                                        ),
                                      );
                                    }),
                                const Text("View Fee",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
