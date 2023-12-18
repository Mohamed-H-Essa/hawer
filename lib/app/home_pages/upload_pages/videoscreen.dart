// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoScreen extends StatelessWidget {
//   final String videoUrl;
//
//   VideoScreen({required this.videoUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Uploaded Video'),
//       ),
//       body: Center(
//         child: AspectRatio(
//           aspectRatio: 16 / 9,
//           child: VideoPlayer(VideoPlayerController.network(videoUrl)),
//         ),
//       ),
//     );
//   }
// }