import 'package:flutter/material.dart';
import 'package:iyun4/models/lesson_model.dart';
import 'package:video_player/video_player.dart';

class LessonItem extends StatefulWidget {
  const LessonItem({super.key, required this.lesson});

  final LessonModel lesson;

  @override
  State<LessonItem> createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"));
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _controller.value.isInitialized
              ? Stack(
                  children: [
                    Container(
                      //margin: const EdgeInsets.symmetric(horizontal: 20),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.lesson.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.lesson.description,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
