import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/Saved_Items/saved_page.dart';
import 'package:hawer_app/app/settings_pages/aboutUs.dart';
import 'package:hawer_app/app/settings_pages/contact_us.dart';
import 'package:hawer_app/app/settings_pages/our_vision.dart';
import 'package:hawer_app/app/settings_pages/usage_conditions.dart';
import '../../core/constants.dart';
import '../home_pages/home.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "حاوِر",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Constants.darkBlue,
        leading: const SizedBox(),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 60,
      //     width: 90,
      //     color: Constants.darkBlue,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         GestureDetector(
      //             onTap: () {}, child: Image.asset("images/Settings.png")),
      //         GestureDetector(
      //             onTap: () {
      //               Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => const Saved(),
      //                 ),
      //               );
      //             },
      //             child: Image.asset("images/Bookmark.png")),
      //         GestureDetector(
      //             onTap: () {
      //               Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => const Home(),
      //                 ),
      //               );
      //             },
      //             child: Image.asset("images/Home.png")),
      //       ],
      //     ),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 327,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                },
                height: 54,
                //elevation: 10,
                color: Constants.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "من نحن",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 327,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactUs(),
                    ),
                  );
                },
                height: 54,
                //elevation: 10,
                color: Constants.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تواصل معنا",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 327,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OurVision(),
                    ),
                  );
                },
                height: 54,
                //elevation: 10,
                color: Constants.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "رؤيتنا",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 327,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsageConditions(),
                    ),
                  );
                },
                height: 54,
                //elevation: 10,
                color: Constants.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide.none),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "شروط الاستخدام",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
