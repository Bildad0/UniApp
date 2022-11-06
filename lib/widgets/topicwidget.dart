import 'package:flutter/material.dart';

class TopicWidget extends StatefulWidget {
  const TopicWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopicWidgetState createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
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
                  onTap: (() => {}),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.folder,
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
                const Text("Topic Two"),
                const SizedBox(
                  width: 200,
                ),
                GestureDetector(
                  onTap: (() => {}),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.folder,
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
                const Text("Topic Three"),
                const SizedBox(
                  width: 200,
                ),
                GestureDetector(
                  onTap: (() => {}),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.folder,
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
                  child: Row(
                    children: const [
                      Icon(
                        Icons.folder,
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
