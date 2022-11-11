import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:uniapp/Views/Chats/chart_details_page.dart';
import 'package:uniapp/Views/landingpage.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact>? _contacts;

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.7),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SchoolManagement();
                  }))
                },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        elevation: 0,
        title: (const Text('Contacts')),
      ),
      // ignore: unnecessary_null_comparison
      body: _contacts != null
          //Build a list view of all contacts, displaying their avatar and
          // display name
          ? ListView.builder(
              cacheExtent: 100,
              itemCount: _contacts!.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                Contact? contact = _contacts!.elementAt(index);
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ConversationPage();
                    }))
                  },
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                    leading: (contact.avatar != null &&
                            contact.avatar!.isNotEmpty)
                        ? const CircleAvatar(
                            backgroundImage: NetworkImage('contact.avatar'),
                          )
                        : CircleAvatar(
                            backgroundColor: Theme.of(context).backgroundColor,
                            child: Text(contact.initials()),
                          ),
                    title: Row(
                      children: [
                        Column(
                          children: [
                            Text(contact.displayName ?? ''),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                    //This can be further expanded to showing contacts detail
                    // onPressed().
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.green.withOpacity(0.6),
              backgroundColor: Colors.grey,
            )),
    );
  }
}
