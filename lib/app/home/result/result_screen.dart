import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/core/view/error_page.dart';
import 'package:hawer_app/core/view/loading_screen.dart';
import 'package:hawer_app/app/home/result/result_success_video_screen.dart';
import 'package:hawer_app/core/upload_video_method.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.videoPath,
  }) : super(key: key);

  final String videoPath;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<Either<String, String>>? future;
  @override
  void initState() {
    super.initState();

    future = uploadVideo(File(widget.videoPath));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<String, String>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            bool error = true;
            String res = '';
            snapshot.requireData.fold(
              (l) {
                error = true;
                res = l;
              },
              (r) {
                error = false;
                res = r;
                return print(r);
              },
            );

            return error
                ? ErrorPage(
                    error: res,
                  )
                : ResultSuccessVideoScreen(
                    videoPath: widget.videoPath,
                    resultMessage: res,
                  );
          } else {
            return const LoadingScreen();
          }
        });
  }
}
