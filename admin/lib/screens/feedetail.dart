// ignore_for_file: no_leading_underscores_for_local_identifiers

import '/api/fee_api.dart';
import '/model/allmodels.dart';
import '/notifier/fee_notifier.dart';
import '/screens/fee_form.dart';

import 'package:flutter/material.dart';
import '/screens/professors.dart';
import 'package:provider/provider.dart';

class FeeDetail extends StatelessWidget {
  const FeeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    FeeNotifier feeNotifier = Provider.of<FeeNotifier>(context);

    _onFeeDeleted(Fee fee) {
      Navigator.pop(context);
      feeNotifier.deleteFee(fee);
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
                  builder: (BuildContext context) => const Professors(),
                ),
              );
            }),
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24),
              Text(
                feeNotifier.currentFee.className,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                'Fee: ${feeNotifier.currentFee.fee}',
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'button1',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const FeeForm(
                    isUpdating: true,
                  );
                }),
              );
            },
            foregroundColor: Colors.white,
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'button2',
            onPressed: () => deleteFee(feeNotifier.currentFee, _onFeeDeleted),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
