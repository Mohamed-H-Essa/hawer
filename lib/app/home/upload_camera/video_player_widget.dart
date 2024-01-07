import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.videoPath,
    this.isBytes = false,
    this.playable = true,
  });

  final String videoPath;
  final bool isBytes;
  final bool playable;

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool loading = true;

  Future<void> initFromBytes() async {
    String? videoPath = widget.videoPath;
    if (videoPath.isEmpty) {
      return;
    }

    File fileDef = File(videoPath);
    fileDef.readAsBytes().then((value) {
      _controller = VideoPlayerController.file(File(videoPath))
        ..initialize().then((_) {
          setState(() {
            loading = false;
          });
        });
    });
  }

  @override
  void initState() {
    super.initState();

    bool videoExists = false;

    if (widget.isBytes) {
      initFromBytes().then((value) => null);
    } else {
      File(widget.videoPath).exists().then((value) {
        videoExists = value;
      });

      if (widget.videoPath.isEmpty || !videoExists) {
      } else {}

      _controller = VideoPlayerController.file(File(widget.videoPath))
        ..initialize().then((_) {
          setState(() {
            loading = false;
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              alignment: Alignment.center,
              children: [
                _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
                widget.playable
                    ? FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 40,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
