import 'package:flutter/material.dart';
import 'package:talkjs_flutter/talkjs_flutter.dart';
import '../../Models/chart_message_model.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  // List<ChatMessage> messages = [
  //   ChatMessage(messageContent: "Hello, Billy", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Hey billy, I am doing fine dude. wbu?",
  //       messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Is there any thing wrong?", messageType: "sender"),
  // ];
  bool chatBoxVisible = false;

  @override
  Widget build(BuildContext context) {
    final session = Session(appId: 'tI1Iukeh');

    final me = session.getUser(
      id: '123456',
      name: 'Alice',
      email: ['alice@example.com'],
      photoUrl: 'https://talkjs.com/images/avatar-1.jpg',
      welcomeMessage: 'Hey there! How are you? :-)',
      role: 'default',
    );
    session.me = me;
    final other = session.getUser(
      id: '654321',
      name: 'Sebastian',
      email: ['Sebastian@example.com'],
      photoUrl: 'https://talkjs.com/images/avatar-5.jpg',
      welcomeMessage: 'Hey, how can I help?',
      role: 'default',
    );

    final conversation = session.getConversation(
      id: Talk.oneOnOneId(me.id, other.id),
      participants: {Participant(me), Participant(other)},
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Column(
          children: <Widget>[
            Visibility(
              visible: !chatBoxVisible,
              child: const SizedBox(
                // width: 50,
                // height: 50,
                child: LinearProgressIndicator(
                  minHeight: 1.0,
                  color: Colors.blueGrey,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Visibility(
              maintainState: true,
              visible: chatBoxVisible,
              child: ConstrainedBox(
                constraints: constraints,
                child: SizedBox(
                  child: ChatBox(
                    session: session,
                    conversation: conversation,
                    onLoadingStateChanged: (state) {
                      setState(() {
                        if (state == LoadingState.loaded) {
                          chatBoxVisible = true;
                        } else {
                          chatBoxVisible = false;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //currently using a massaging Talkjs API will build own massaging page
      // body: ChatBox(
      //   session: session,
      //   conversation: conversation,
      // )

      // body: Stack(
      //   children: [
      //     ListView.builder(
      //       itemCount: messages.length,
      //       shrinkWrap: true,
      //       padding: const EdgeInsets.only(top: 10, bottom: 10),
      //       physics: const NeverScrollableScrollPhysics(),
      //       itemBuilder: (context, index) {
      //         return Container(
      //           padding: const EdgeInsets.only(
      //               left: 14, right: 14, top: 10, bottom: 10),
      //           child: Align(
      //             alignment: (messages[index].messageType == "receiver"
      //                 ? Alignment.topLeft
      //                 : Alignment.topRight),
      //             child: Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 color: (messages[index].messageType == "receiver"
      //                     ? Colors.grey.shade200
      //                     : Colors.blue[200]),
      //               ),
      //               padding: const EdgeInsets.all(16),
      //               child: Text(
      //                 messages[index].messageContent,
      //                 style: const TextStyle(fontSize: 15),
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //     Align(
      //       alignment: Alignment.bottomLeft,
      //       child: Container(
      //         padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      //         height: 60,
      //         width: double.infinity,
      //         color: Colors.white,
      //         child: Row(
      //           children: <Widget>[
      //             GestureDetector(
      //               onTap: () {},
      //               child: Container(
      //                 height: 30,
      //                 width: 30,
      //                 decoration: BoxDecoration(
      //                   color: Colors.lightGreen,
      //                   borderRadius: BorderRadius.circular(30),
      //                 ),
      //                 child: const Icon(
      //                   Icons.add,
      //                   color: Colors.white,
      //                   size: 20,
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               width: 15,
      //             ),
      //             const Expanded(
      //               child: TextField(
      //                 decoration: InputDecoration(
      //                     hintText: "Write message...",
      //                     hintStyle: TextStyle(color: Colors.black54),
      //                     border: InputBorder.none),
      //               ),
      //             ),
      //             const SizedBox(
      //               width: 15,
      //             ),
      //             FloatingActionButton(
      //               onPressed: () {},
      //               backgroundColor: Colors.green,
      //               elevation: 0,
      //               child: const Icon(
      //                 Icons.send,
      //                 color: Colors.white,
      //                 size: 18,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
