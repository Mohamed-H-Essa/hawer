import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:hawer_app/app/home_pages/record_pages/result_screen.dart';
import 'package:hawer_app/app/home_pages/upload_pages/recording_container.dart';
import 'package:hawer_app/core/constants.dart';
import 'package:path_provider/path_provider.dart';

class UploadUsingCamera extends StatefulWidget {
  @override
  _UploadUsingCameraState createState() => _UploadUsingCameraState();
}

class _UploadUsingCameraState extends State<UploadUsingCamera> {
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;
  String? _videoPath;

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras[0];

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _cameraController?.initialize();

    setState(() {});
  }

  Future<void> _startRecording() async {
    try {
      await _initializeControllerFuture;

      final appDirectory = await getApplicationDocumentsDirectory();
      _videoPath = '${appDirectory.path}/video.mp4';

      await _cameraController?.startVideoRecording();
      setState(() {});
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    if (_cameraController != null &&
        _cameraController!.value.isRecordingVideo) {
      try {
        XFile file = await _cameraController!.stopVideoRecording();
        setState(() {});
        _videoPath = file.path;
        // Call the method to upload the video
        _uploadVideo(_videoPath!);
        setState(() {});
      } catch (e) {
        print('Error stopping recording: $e');
      }
    }
  }

  void _uploadVideo(String videoPath) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ResultScreen(
              videoPath: videoPath,
            )));
    // uploadVideo(File(videoPath));
  }

  @override
  void dispose() {
    super.dispose();
    cleanUp().then((value) => null);
  }

  Future<void> cleanUp() async {
    await _cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(_cameraController?.value.isRecordingVideo);
            double scale = 1 / 2;
            final mediaSize = MediaQuery.of(context).size;

            if (_cameraController != null) {
              scale = 1 /
                  (_cameraController!.value.aspectRatio *
                      mediaSize.aspectRatio);
            }
            return Scaffold(
              appBar: AppBar(
                leadingWidth: 0,
                title: Text('تسجيل الفيديو '),
                backgroundColor: Constants.darkBlue,
                leading: SizedBox(),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      textDirection: TextDirection.ltr,
                    ),
                  )
                ],
              ),
              body: _cameraController == null
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.red,
                            // padding: EdgeInsets.only(
                            //   top: mediaSize.height * 0.12,
                            //   // horizontal: 40,
                            // ),
                            child: ClipRect(
                              clipper: _MediaSizeClipper(mediaSize),
                              child: Transform.scale(
                                  alignment: Alignment.center,
                                  // scale: scale * 1.41,
                                  scale: scale * 1.18,
                                  child: CameraPreview(
                                    _cameraController!,
                                  )),
                            ),
                          ),
                          _cameraController != null &&
                                  _cameraController!.value.isRecordingVideo
                              ? RecordingContainer()
                              : SizedBox(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: FloatingActionButton(
                                backgroundColor: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    if (_cameraController!
                                        .value.isRecordingVideo) {
                                      print('stop recording called');
                                      _stopRecording();
                                    } else {
                                      print('start recording called');
                                      _startRecording();
                                    }
                                  });
                                },
                                child: Icon(
                                  size: 40,
                                  _cameraController == null ||
                                          !_cameraController!
                                              .value.isRecordingVideo
                                      ? Icons.videocam
                                      : Icons.stop,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
