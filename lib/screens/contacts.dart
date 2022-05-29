import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF496d60),
        elevation: 0.0,
        leading: GestureDetector(
          child: Container(
            height: 28.0,
            width: 28.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Contacts',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
      body: _permissionDenied
          ? const Center(
              child: Text(
                'Contacts permission is required',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            )
          : _contacts == null
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : ListView.builder(
                  itemBuilder: contactBox,
                  itemCount: _contacts!.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
      backgroundColor: const Color(0xFF496d60),
    );
  }

  Widget contactBox(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        // check if number is in voicess database
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 36.0,
                    width: 36.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF496d60),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _contacts![index].displayName,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 17.0),
                      ),
                      Text(
                        _contacts![index].phones.isNotEmpty
                            ? _contacts![index].phones.first.number
                            : "No number",
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 28.0,
                width: 28.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.refresh_rounded,
                  color: Color(0xFF496d60),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() => _contacts = contacts);
    }
  }
}
