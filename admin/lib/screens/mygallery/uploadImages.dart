// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import './utils.dart';

class UploadImages extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  const UploadImages({Key? key, required this.globalKey}) : super(key: key);
  @override
  _UploadImagesState createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  List<Asset> images = <Asset>[];
  List<String> imageUrls = <String>[];
  String _error = 'No Error Dectected';
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        print(asset.getByteData(quality: 100));
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ThreeDContainer(
            backgroundColor: MultiPickerApp.background,
            backgroundDarkerColor: MultiPickerApp.background,
            height: 50,
            width: 50,
            borderDarkerColor: MultiPickerApp.background,
            borderColor: MultiPickerApp.background,
            key: null,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: loadAssets,
                  child: ThreeDContainer(
                    width: 130,
                    height: 50,
                    backgroundColor: MultiPickerApp.background,
                    backgroundDarkerColor: MultiPickerApp.background,
                    borderColor: MultiPickerApp.background,
                    borderDarkerColor: MultiPickerApp.background,
                    child: const Center(
                        child: Text(
                      "Pick file",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (images.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              content: const Text("No file selected",
                                  style: TextStyle(color: Colors.white)),
                              actions: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: ThreeDContainer(
                                    width: 80,
                                    height: 30,
                                    backgroundColor: MultiPickerApp.background,
                                    backgroundDarkerColor:
                                        MultiPickerApp.background,
                                    borderDarkerColor:
                                        MultiPickerApp.background,
                                    borderColor: MultiPickerApp.background,
                                    child: const Center(
                                        child: Text(
                                      "Ok",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                )
                              ],
                            );
                          });
                    } else {
                      SnackBar snackbar = const SnackBar(
                          content: Text('Please wait, we are uploading'));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      uploadImages();
                    }
                  },
                  child: ThreeDContainer(
                    offset: 0,
                    width: 130,
                    height: 50,
                    backgroundColor: MultiPickerApp.background,
                    backgroundDarkerColor: MultiPickerApp.background,
                    key: null,
                    borderDarkerColor: MultiPickerApp.background,
                    borderColor: MultiPickerApp.background,
                    child: const Center(
                        child: Text(
                      "Upload Files",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: buildGridView(),
            )
          ],
        ),
      ],
    );
  }

  void uploadImages() {
    for (var imageFile in images) {
      postImage(imageFile).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
        if (imageUrls.length == images.length) {
          String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
          FirebaseFirestore.instance
              .collection('images')
              .doc(documnetID)
              .set({'urls': imageUrls}).then((_) {
            SnackBar snackbar =
                const SnackBar(content: Text('Uploaded Successfully'));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            setState(() {
              images = [];
              imageUrls = [];
            });
          });
        }
      }).catchError((err) {
        print(err);
      });
    }
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Upload File",
          allViewTitle: "All Files",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
      print(resultList.length);
      print((await resultList[0].getThumbByteData(122, 100)));
      print((await resultList[0].getByteData()));
      print((await resultList[0].metadata));
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      images = resultList;
      _error = error;
    });
  }

  Future<dynamic> postImage(Asset imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask =
        reference.putData((await imageFile.getByteData()).buffer.asUint8List());
    //  TaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    //   print(storageTaskSnapshot.ref.getDownloadURL());
    //   return storageTaskSnapshot.ref.getDownloadURL();

    var imageUrl = await (await uploadTask).ref.getDownloadURL();
    String url = imageUrl.toString();
    print(url);
    return url;
  }
}
