import 'package:flutter/material.dart';

import 'package:voicess/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool recents = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF496d60),
        elevation: 1.0,
        title: const Text(
          'Voicess',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
        actions: [
          GestureDetector(
            child: Container(
              height: 28.0,
              width: 28.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xFF496d60),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const OptionsScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Recents',
              style: TextStyle(
                color: Color(0xFF496d60),
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            child: recents
                ? ListView.builder(
                    itemBuilder: messageWidget,
                    itemCount: 15,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  )
                : const Center(
                    child: Text(
                      'No recent chats',
                      style: TextStyle(
                        color: Color(0xFF496d60),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const ContactsScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xFF496d60),
        tooltip: "view contacts",
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // backgroundColor: const Color(0xFF496d60),
    );
  }

  Widget messageWidget(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                const ChatScreen(withWho: "UserName"),
          ),
        );
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
                      color: Color(0xFF496d60),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    'Username',
                    style: TextStyle(color: Color(0xFF496d60), fontSize: 20.0),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10.0),
                  index % 2 == 0
                      ? Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF496d60),
                          ),
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                          ),
                        )
                      : const SizedBox(height: 10.0),
                  const Text(
                    '18:45',
                    style: TextStyle(fontSize: 14.0, color: Color(0xFF496d60)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
