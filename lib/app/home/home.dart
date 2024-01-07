import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/saved/saved_page.dart';
import 'package:hawer_app/app/home/record_pages/result_screen.dart';
import 'package:hawer_app/app/home/upload_pages/upload_camera.dart';
import 'package:hawer_app/app/home/upload_pages/upload_from_gallery.dart';
import 'package:hawer_app/app/info/settings.dart';
import 'package:hawer_app/core/transition_animation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import '../../core/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(
    initialPage: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          width: 90,
          color: Constants.darkBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _navigateToPage(0);
                },
                child: Image.asset("images/Settings.png"),
              ),
              GestureDetector(
                onTap: () {
                  _navigateToPage(1);
                },
                child: Image.asset("images/Bookmark.png"),
              ),
              GestureDetector(
                onTap: () {
                  _navigateToPage(2);
                },
                child: Image.asset("images/Home.png"),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {});
        },
        children: const [
          InfoScreen(),
          SavedScreen(),
          MainPage(),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File? _selectedVideo;
  VideoPlayerController? _videoController;

  @override
  void dispose() {
    super.dispose();
    cleanUp().then((value) => null);
  }

  Future<void> cleanUp() async {
    if (_videoController != null) {
      _videoController!.removeListener(() {});
      await _videoController!.dispose();
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
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "اختر الطريقة المناسبة لك ",
            style: TextStyle(fontSize: 22),
          ),
          const Text(
            " لإدخال الفيديو",
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UploadUsingCamera(),
                ),
              );
            },
            child: Image.asset("images/Group 2.png"),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              bool? perm = prefs.getBool('permission');
              perm == true ? _pickAndUploadVideo() : _showPermissionDialog();
            },
            child: Image.asset("images/Group 1.png"),
          ),
        ],
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
          content: Text(
            'السماح للتطبيق بالوصول إلى الصور والوسائط على جهازك.',
            style: TextStyle(color: Constants.darkBlue, fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'الرفض',
                style: TextStyle(color: Constants.darkBlue, fontSize: 14),
              ),
            ),
            TextButton(
              onPressed: () {
                _checkAndRequestPermission(context);
              },
              child: Text(
                'السماح',
                style: TextStyle(color: Constants.darkBlue, fontSize: 14),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _checkAndRequestPermission(BuildContext ctx) async {
    PermissionStatus ps = await Permission.manageExternalStorage.request();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (ps.isGranted) {
      prefs.setBool('permission', true);
    } else {
      prefs.setBool('permission', false);
    }
    _pickAndUploadVideo();
    Navigator.of(context).pop();
  }

  Future<void> _pickAndUploadVideo() async {
    final XFile? pickedFile = await ImagePicker()
        .pickVideo(source: ImageSource.gallery); // why 2 times

    if (pickedFile == null) {
      return;
    }

    print(pickedFile.path);

    setState(() {
      _selectedVideo = File(pickedFile.path);
      _videoController = VideoPlayerController.file(_selectedVideo!)
        ..initialize().then((_) {
          // _videoController!.play();
        });
    });

    _uploadVideo(_selectedVideo!.path);
    // await uploadVideo(_selectedVideo!);
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
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: const BoxDecoration(
              color: Color(0xff07A304),
              //borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(fontSize: 14, color: Colors.white),
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
              child: const Center(
                child: Text(
                  "تم الحفظ بنجاح",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              )),
        );
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }
}
