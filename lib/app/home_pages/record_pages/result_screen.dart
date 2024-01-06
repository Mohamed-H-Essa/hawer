import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/home_pages/record_pages/error_page.dart';
import 'package:hawer_app/app/home_pages/record_pages/loading_screen.dart';
import 'package:hawer_app/app/home_pages/record_pages/result_video_screen.dart';
import 'package:hawer_app/core/upload_video_method.dart';

import '../../../core/constants.dart';

class ResultScreen extends StatefulWidget {
  // final File? image;
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
                : ResultVideoScreen(
                    videoPath: widget.videoPath,
                    resultMessage: res,
                  );
          } else {
            return const LoadingScreen();
          }
        });
  }
}

class ShowResult extends StatelessWidget {
  const ShowResult({
    super.key,
    required this.videoPath,
  });

  final String videoPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 207,
          ),
          const Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("images/video.png")),
            ],
          ),
          const SizedBox(
            height: 300,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultVideoScreen(
                      videoPath: videoPath,
                      resultMessage: "hi",
                    ),
                  ),
                );
              },
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                  side: BorderSide.none),
              color: Constants.darkBlue,
              height: 60,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (Text(
                    "التالي",
                    style: TextStyle(fontSize: 17.28, color: Colors.white),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
