import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoDisplayWidget extends StatefulWidget {
  final String videoPath;

  VideoDisplayWidget({required this.videoPath});

  @override
  _VideoDisplayWidgetState createState() => _VideoDisplayWidgetState();
}

class _VideoDisplayWidgetState extends State<VideoDisplayWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.videoPath));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9, // Adjust as needed
      autoPlay: true,
      looping: false,
    );

    // Set state when initialization is complete
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : Chewie(
            controller: _chewieController,
          );
  }
}
