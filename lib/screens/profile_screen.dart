import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<ProfileScreen> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CircleAvatar(backgroundColor: Colors.white),
            SizedBox(height: 10.0),
            Text(
              'Number',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              '+2457000000',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Name',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'username used',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Joined at',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'May 5, 2020',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Account status',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Active',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF496d60),
    );
  }
}
