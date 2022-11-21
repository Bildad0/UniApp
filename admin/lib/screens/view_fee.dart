// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/api/fee_api.dart';
import '/api/teacher_api.dart';
import '/model/allmodels.dart';
import '/notifier/auth_notifier.dart';
import '/notifier/fee_notifier.dart';
import '/notifier/teacher_notifier.dart';
import '/screens/fee_form.dart';
import '/screens/fees.dart';

class ViewFee extends StatefulWidget {
  const ViewFee({super.key});

  @override
  _ViewFeeState createState() => _ViewFeeState();
}

class _ViewFeeState extends State<ViewFee> {
  @override
  void initState() {
    TeacherNotifier teacherNotifier =
        Provider.of<TeacherNotifier>(context, listen: false);
    getTeachers(teacherNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    FeeNotifier feeNotifier = Provider.of<FeeNotifier>(context);

    _onFeeDeleted(Fee fee) {
      Navigator.pop(context);
      feeNotifier.deleteFee(fee);
    }

    Future<void> _refreshList() async {
      getFee(feeNotifier);
    }

    print("building View fee");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            iconSize: 20,
            // highlightColor: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Fees(),
                ),
              );
            }),
        title: const Text("Fee List"),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.withOpacity(0.5),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshList,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Class:   ${feeNotifier.feeList[index].className}'),
              subtitle: Text('Fee:  ${feeNotifier.feeList[index].fee}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const FeeForm(
                            isUpdating: true,
                          );
                        }),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteFee(feeNotifier.currentFee, _onFeeDeleted);
                    },
                  ),
                ],
              ),
            );
          },
          itemCount: feeNotifier.feeList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.black,
            );
          },
        ),
      ),
    );
  }
}
