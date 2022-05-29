import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String withWho;
  const ChatScreen({Key? key, required this.withWho}) : super(key: key);

  @override
  State<ChatScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<ChatScreen> {
  bool recordSheet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF496d60),
        elevation: 1.0,
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
        title: Text(
          widget.withWho,
          style: const TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
      body: GestureDetector(
        child: ListView.builder(
          itemBuilder: chatBox,
          itemCount: 7,
        ),
        onTap: () {
          if (recordSheet == false) {
            return;
          }
          setState(() {
            recordSheet = !recordSheet;
          });
        },
      ),
      bottomSheet: recordSheet
          ? BottomSheet(
              onClosing: () {},
              backgroundColor: const Color(0xFF496d60),
              builder: recordSheetWidget,
              enableDrag: false,
            )
          : null,
      floatingActionButton: recordSheet
          ? null
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  recordSheet = !recordSheet;
                });
              },
              backgroundColor: const Color(0xFF496d60),
              child: const Icon(Icons.mic, color: Colors.white),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget recordSheetWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xFF496d60),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.star_border_rounded,
                    color: Color(0xFF496d60),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Text(
            '0:00',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.stop_rounded,
                    color: Color(0xFF496d60),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.circle_rounded,
                    color: Color(0xFF496d60),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.mic_off_rounded,
                    color: Color(0xFF496d60),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget chatBox(BuildContext context, int index) {
    return Container(
      height: 80.0,
      width: double.infinity,
      padding: const EdgeInsets.all(5.0),
      margin: index % 2 == 0
          ? const EdgeInsets.only(right: 20.0, bottom: 5.0)
          : const EdgeInsets.only(left: 20.0, bottom: 5.0),
      decoration: const BoxDecoration(
        color: Color(0xFF496d60),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
              ),
              Row(
                children: [
                  const Text(
                    '0:12s',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    height: 28.0,
                    width: 28.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Color(0xFF496d60),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Text(
            '2020-01-11, 15:12',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white30,
            ),
          )
        ],
      ),
    );
  }
}
