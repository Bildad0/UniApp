import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeesPage extends StatefulWidget {
  const FeesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FeesPageState createState() => _FeesPageState();
}

class _FeesPageState extends State<FeesPage> {
  var year = DateFormat('y').format(DateTime.now());
  var month = DateFormat('MMM').format(DateTime.now());
  var date = DateTime.now().day;
  var day = DateFormat('EEE').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                      text: day,
                      style: const TextStyle(
                          color: Color(0XFF263064),
                          fontSize: 12,
                          fontWeight: FontWeight.w900),
                      children: [
                        TextSpan(
                          text: "  $date $month", //neccessary space for date
                          style: const TextStyle(
                              color: Color(0XFF263064),
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Here is your financial status",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Color(0XFF343E87),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Balance: Ksh 21,000",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 185,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height - 245,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView(
              children: [
                buildTitleRow("FEES STATEMENTS"),
                const SizedBox(
                  height: 20,
                ),
                buildClassItem(),
                buildClassItem(),
                buildClassItem(),
                buildClassItem(),
                buildClassItem(),
                buildClassItem(),
                buildClassItem(),
                buildClassItem(),
                const SizedBox(
                  height: 25,
                ),
                buildTitleRow("FEES PAYMENT METHODS"),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildTaskItem("MPESA", Colors.green, "Till: 564773"),
                      buildTaskItem("BANK", Colors.green, "Account: 12345678"),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Container buildTaskItem(String title, Color color, String paymentMethod) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [Text(paymentMethod)],
          ),
        ],
      ),
    );
  }

  Row buildTitleRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: title,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              children: const [
                TextSpan(
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
              ]),
        ),
      ],
    );
  }

  Container buildClassItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "T1234",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "23/10/2022",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 160,
                child: const Text(
                  "Transaction details",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 160,
                    child: const Text(
                      "Mpesa",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Bildad",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
