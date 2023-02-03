//import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ViewImages extends StatelessWidget {
  List<NetworkImage> _listOfImages = <NetworkImage>[];

  ViewImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Flexible(
            child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('files').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          _listOfImages = [];
                          for (int i = 0;
                              i < snapshot.data?.docs[index]['urls'].length;
                              i++) {
                            _listOfImages.add(NetworkImage(
                                snapshot.data!.docs[index]['urls'][i]));
                          }
                          return Card(
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.all(10.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: CarouselSlider(
                                      options: CarouselOptions(height: 400.0),
                                      items: const [],
                                      // boxFit: BoxFit.cover,
                                      // images: ,
                                      // autoplay: false,
                                      // indicatorBgPadding: 5.0,
                                      // dotPosition: DotPosition.bottomCenter,
                                      // animationCurve: Curves.fastOutSlowIn,
                                      // animationDuration:
                                      //     Duration(milliseconds: 2000)),
                                    )),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }))
      ],
    );
  }
}
