import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ralp/ui/search_page/search_page.dart';
import 'package:video_player/video_player.dart';

import '../../util/ui/routes.dart';
import '../../util/ui/transitions.dart';

class HomeView extends StatefulWidget {
  final Object? userData;

  const HomeView(this.userData, {super.key});

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  List<Widget> videoList = [];
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'Profile'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.search), label: Routes.SEARCH_ROUTE),
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: Routes.HOME_ROUTE),
  ];

  @override
  void initState() {
    super.initState();
    logger.d("USERDATA", widget.userData);
    final storageRef = FirebaseStorage.instance.ref();
    storageRef.listAll().then((listResult) => {
          logger.d(listResult.items.length),
          listResult.items.forEach((item) {
            // if (item.fullPath.contains("Art")) {
            storageRef.child(item.fullPath).getDownloadURL().then((videoUrl) {
              final controller = VideoPlayerController.network(videoUrl);
              controller.initialize().then((_) {
                videoList.add(Container(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(controller),
                        _ControlsOverlay(controller: controller),
                        VideoProgressIndicator(controller,
                            allowScrubbing: true),
                      ],
                    ),
                  ),
                ));
                // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                setState(() {});
              });
            });
            // }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xff201822),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 80, left: 20, right: 40, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 50.0,
                          letterSpacing: 0.5,
                          color: Color(0xffB164EE),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              SlideRightRoute(
                                  page: const SearchView(),
                                  route: Routes.SEARCH_ROUTE));
                        },
                        child: const Icon(
                          Icons.search,
                          color: Color(0xffB164EE),
                          size: 35.0,
                        ),
                      )
                    ],
                  ),
                ),
                ...videoList
              ]),
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: (index) {
          Navigator.pushNamed(context, items[index].label!);
        },
      ),
    );
  }
}

class _ControlsOverlay extends StatefulWidget {
  final VideoPlayerController controller;

  const _ControlsOverlay({required this.controller});

  @override
  State<StatefulWidget> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<_ControlsOverlay> {
  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: isPlaying
              ? Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Pause',
                    ),
                  ),
                )
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.controller.value.isPlaying) {
              widget.controller.pause();
              setState(() {
                isPlaying = false;
              });
            } else {
              widget.controller.play();
              setState(() {
                isPlaying = true;
              });
            }
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: widget.controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              widget.controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                  '${widget.controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: widget.controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              widget.controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${widget.controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
