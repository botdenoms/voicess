import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
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
      body: ListView.builder(
        itemBuilder: contactBox,
        itemCount: 40,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
      ),
      backgroundColor: const Color(0xFF496d60),
    );
  }

  Widget contactBox(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
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
                    children: const [
                      Text(
                        'Username',
                        style: TextStyle(color: Colors.white, fontSize: 17.0),
                      ),
                      Text(
                        '+245712345678',
                        style: TextStyle(color: Colors.white54, fontSize: 12.0),
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
}
