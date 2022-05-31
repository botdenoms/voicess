import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class ChatTwo extends StatefulWidget {
  final String withWho;
  const ChatTwo({Key? key, required this.withWho}) : super(key: key);

  @override
  State<ChatTwo> createState() => _ChatTwoState();
}

class _ChatTwoState extends State<ChatTwo> {
  int uiState = 0;
  bool isRecording = false;
  bool isPlaying = false;

  late final RecorderController recorderController;
  late final PlayerController playerController;

  String? _pathUrl;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  _initControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
    playerController = PlayerController()
      ..addListener(() {
        if (mounted) setState(() {});
      });
  }

  @override
  void dispose() {
    recorderController.disposeFunc();
    playerController.disposeFunc();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
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
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemBuilder: chatBox,
              itemCount: 7,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFF334E41),
              width: double.infinity,
              height: double.infinity,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: uiState == 0
                    ? GestureDetector(
                        child: Container(
                          height: 48.0,
                          width: 48.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.mic_rounded,
                            color: Color(0xFF496d60),
                          ),
                        ),
                        onTap: () async {
                          //switch to ui 2
                          // recorderController.refresh();
                          recorderController.reset();
                          setState(() {
                            uiState = 1;
                            isRecording = false;
                          });
                        },
                      )
                    : uiState == 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AudioWaveforms(
                                size: Size(screen.width * .4, 50),
                                recorderController: recorderController,
                                enableGesture: true,
                                // shouldCalculateScrolledPosition: true,
                                waveStyle: const WaveStyle(
                                  waveColor: Colors.white,
                                  showMiddleLine: false,
                                  extendWaveform: true,
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  height: 48.0,
                                  width: 48.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isRecording
                                        ? Icons.pause_rounded
                                        : Icons.circle_rounded,
                                    color: const Color(0xFF496d60),
                                  ),
                                ),
                                onTap: () async {
                                  // toggle recording btw pause and record
                                  if (isRecording) {
                                    await recorderController.pause();
                                    isRecording = false;
                                    setState(() {});
                                  } else {
                                    await recorderController.record();
                                    isRecording = true;
                                    setState(() {});
                                  }
                                  // setState(() {
                                  //   isRecording = !isRecording;
                                  // });
                                },
                              ),
                              GestureDetector(
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
                                onTap: () async {
                                  // finish the recorder and switch to ui 3

                                  _pathUrl =
                                      await recorderController.stop(true);
                                  await playerController
                                      .preparePlayer(_pathUrl!);

                                  setState(() {
                                    isRecording = false;
                                    isPlaying = false;
                                    uiState = 2;
                                  });
                                },
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: 48.0,
                                  width: 48.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.delete_rounded,
                                    color: Color(0xFF496d60),
                                  ),
                                ),
                                onTap: () async {
                                  // delete recorded audio & switch to ui 1
                                  if (isPlaying) {
                                    // await playerController.stopPlayer();
                                  }
                                  playerController.stopPlayer();

                                  setState(() {
                                    isPlaying = false;
                                    isRecording = false;
                                    uiState = 0;
                                  });
                                },
                              ),
                              AudioFileWaveforms(
                                size: Size(screen.width * .3, 50),
                                playerController: playerController,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                enableSeekGesture: false,
                                // playerWaveStyle: const PlayerWaveStyle(
                                //   liveWaveColor: Colors.red,
                                //   fixedWaveColor: Colors.black,
                                // ),
                              ),
                              GestureDetector(
                                child: Container(
                                  height: 48.0,
                                  width: 48.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isPlaying
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    color: const Color(0xFF496d60),
                                  ),
                                ),
                                onTap: () async {
                                  // await playerController
                                  //     .preparePlayer(_pathUrl!);
                                  if (_pathUrl == null) {
                                    // ignore: avoid_print
                                    print("null url path");
                                  }
                                  // toggle playing state of recording made
                                  if (isPlaying &&
                                      playerController.playerState ==
                                          PlayerState.playing) {
                                    await playerController.pausePlayer();
                                    isPlaying = false;
                                  } else {
                                    await playerController.startPlayer(true);
                                    isPlaying = true;
                                  }
                                  // setState(() {
                                  //   isPlaying = !isPlaying;
                                  // });
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  height: 48.0,
                                  width: 48.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.send_rounded,
                                    color: Color(0xFF496d60),
                                  ),
                                ),
                                onTap: () async {
                                  if (isPlaying) {
                                    // await playerController.stopPlayer();
                                  }
                                  playerController.stopPlayer();
                                  // send recorded audio to database
                                  // switch to ui 1
                                  setState(() {
                                    isPlaying = false;
                                    isRecording = false;
                                    uiState = 0;
                                  });
                                },
                              ),
                            ],
                          ),
              ),
            ),
          )
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
        color: Color(0xFF496D60),
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
