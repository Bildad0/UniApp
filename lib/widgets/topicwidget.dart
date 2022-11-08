import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class TopicWidget extends StatefulWidget {
  const TopicWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopicWidgetState createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  String remotePDFpath = "";

  @override
  void initState() {
    super.initState();

    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    //print("Start download file from internet!");
    try {
      const url = "https://www.africau.edu/images/default/sample.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getTemporaryDirectory();
      //print("Download files");
      //print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text("Topic one"),
                const SizedBox(
                  width: 200,
                ),
                GestureDetector(
                  onTap: () {
                    if (remotePDFpath.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(path: remotePDFpath),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.file_download_sharp,
                        color: Color.fromARGB(255, 43, 84, 155),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("pdf"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text("Topic Two"),
                const SizedBox(
                  width: 200,
                ),
                GestureDetector(
                  onTap: () {
                    if (remotePDFpath.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(path: remotePDFpath),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.file_download_sharp,
                        color: Color.fromARGB(255, 43, 84, 155),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("pdf"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text("Topic Three"),
                const SizedBox(
                  width: 200,
                ),
                GestureDetector(
                  onTap: () {
                    if (remotePDFpath.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(path: remotePDFpath),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.file_download_sharp,
                        semanticLabel: "pdf",
                        color: Color.fromARGB(255, 43, 84, 155),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("pdf"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Text("Topic Four"),
                const SizedBox(
                  width: 200,
                ),
                GestureDetector(
                  onTap: () {
                    if (remotePDFpath.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(path: remotePDFpath),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.file_download_sharp,
                        semanticLabel: "pdf",
                        color: Color.fromARGB(255, 43, 84, 155),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("pdf"),
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
}

class PDFScreen extends StatefulWidget {
  final String? path;

  const PDFScreen({Key? key, this.path}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Document".toUpperCase(),
            style: const TextStyle(color: Colors.blueGrey),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              //print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              //print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              //print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              //print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              backgroundColor: Colors.blueGrey,
              label: Text("Next (${pages! ~/ 2})"),
              onPressed: () async {
                await snapshot.data!.setPage(pages! ~/ 2);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
