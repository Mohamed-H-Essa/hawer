import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hawer_app/core/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:video_player/video_player.dart';
class Uploadmain extends StatefulWidget {
  const Uploadmain({super.key});

  @override
  _UploadmainState createState() => _UploadmainState();
}

class _UploadmainState extends State<Uploadmain> {
  File? _selectedVideo;
  VideoPlayerController? _videoController;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedVideo == null
                ? Column(
              //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text('لكي تبدأ في استخدام البرنامج اختر الطريقة',style: TextStyle(fontSize: 15),),
                          Text('المناسبة لك لإدخال الفيديو.',style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 150,),
                    ElevatedButton(
                      onPressed: () {
                        _showPermissionDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.darkBlue,),
                      child: const Text('اختر الفيديو'),
                    ),
                  ],
                )
                : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                          child: Text("نتيجة العملية :",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Constants.darkBlue),)),
                      const SizedBox(height: 90,),
                      AspectRatio(
              aspectRatio: 20 / 20,
              child: VideoPlayer(_videoController!),
            ),
                      const SizedBox(height: 110,),
                      MaterialButton(onPressed: (){
                        _showCustomDialog(context);


                       // showCenterSnackBar(context, 'تم الحفظ بنجاح');
                        // final snackBar = SnackBar(
                        //   backgroundColor: Color(0xff07A304),
                        //   content: Text('تم الحفظ بنجاح',style: TextStyle(fontSize: 14,color: Colors.white),),
                        //   duration: Duration(seconds: 2),
                        //   behavior: SnackBarBehavior.floating,
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                            (Text("حفظ",style: TextStyle(fontSize: 17.28,color: Colors.white),)),
                          ],
                        ),

                      ),
                    ],
                  ),
                ),
            //SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Future<void> _showPermissionDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: Text('السماح للتطبيق بالوصول إلى الصور والوسائط على جهازك.',style: TextStyle(color: Constants.darkBlue,fontSize: 14),),

          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _checkAndRequestPermission();
              },
              child: Text('السماح',style: TextStyle(color: Constants.darkBlue,fontSize: 14),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('الرفض',style: TextStyle(color: Constants.darkBlue,fontSize: 14),),
            ),
          ],
        );
      },
    );
  }

  Future<void> _checkAndRequestPermission() async {
    final status = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (status == null) {
      print('Permission denied');
    } else {
      await _pickAndUploadVideo();
    }
  }

  Future<void> _pickAndUploadVideo() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedVideo = File(pickedFile.path);
        _videoController = VideoPlayerController.file(_selectedVideo!)
          ..initialize().then((_) {
            _videoController!.play();
          });
      });

      await _uploadVideo(_selectedVideo!);
    }
  }

  Future<void> _uploadVideo(File videoFile) async {
    try {
      Dio dio = Dio();
      String uploadUrl = 'YOUR_UPLOAD_ENDPOINT'; // Replace with your actual upload endpoint

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          videoFile.path,
          filename: 'uploaded_video.mp4',
        ),
      });

      await dio.post(uploadUrl, data: formData);

      print('Video uploaded successfully');
    } catch (error) {
      print('Error uploading video: $error');
    }
  }

  void showCenterSnackBar(BuildContext context, String message) {
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).size.height / 2 - 50.0,
        left: MediaQuery.of(context).size.width / 13,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 330,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: const BoxDecoration(
              color: Color(0xff07A304),
              //borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(fontSize: 14,color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // Display the SnackBar for a few seconds
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff07A304),
                // borderRadius: BorderRadius.circular(16.0),
              ),
              width: 500.0, // Adjust the width as needed
              height: 50.0, // Adjust the height as needed
              child:const Center(
                child: Text("تم الحفظ بنجاح",style: TextStyle(fontSize: 14,color: Colors.white),),
              )
          ),
        );

      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }


}

