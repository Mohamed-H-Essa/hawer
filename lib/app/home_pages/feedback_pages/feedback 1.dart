import 'package:flutter/material.dart';
import 'package:hawer_app/app/Saved_Items/saved_page.dart';
import 'package:hawer_app/app/settings_pages/settings.dart';
//import 'package:flutterapps/VideoPlayerFIle.dart';
//import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants.dart';

class Feedback1 extends StatefulWidget {
  const Feedback1({Key? key}) : super(key: key);

  @override
  State<Feedback1> createState() => _Feedback1State();
}

class _Feedback1State extends State<Feedback1> {
  final ImagePicker picker = ImagePicker();
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings(),
                      ),
                    );
                  },
                  child: Image.asset("images/Settings.png")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SavedScreen(),
                      ),
                    );
                  },
                  child: Image.asset("images/Bookmark.png")),
              GestureDetector(
                  onTap: () {}, child: Image.asset("images/Home.png")),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "سجل حركة",
              style: TextStyle(
                  fontSize: 25,
                  color: Constants.darkBlue,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                children: [
                  Text(
                    "عند فتح الكاميرا يمكنك تسجيل الكلمة التي تريدها ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "بلغة الإشارة و ارسالها لفريق التطوير الخاص بنا",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            GestureDetector(
                onTap: () {}, child: Image.asset("images/Group 2.png")),
          ],
        ),
      ),
    );
  }
}
