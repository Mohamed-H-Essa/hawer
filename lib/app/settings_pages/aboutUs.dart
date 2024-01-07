import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/settings_pages/settings.dart';

import '../../core/constants.dart';
import '../Saved_Items/saved_page.dart';
import '../home_pages/home.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: const Text(
          "من نحن",
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.end,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: IconButton(
                icon: const Icon(CupertinoIcons.arrow_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              ))
        ],
        leading: const SizedBox(),
        backgroundColor: Constants.darkBlue,
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
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => const Settings(),
      //                 ),
      //               );
      //             },
      //             child: Image.asset("images/Settings.png")),
      //         GestureDetector(
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => const SavedScreen(),
      //                 ),
      //               );
      //             },
      //             child: Image.asset("images/Bookmark.png")),
      //         GestureDetector(
      //             onTap: () {
      //               Navigator.push(
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                // height: 7,
                ),
            Padding(
              padding: EdgeInsets.only(
                left: 4,
                right: 4,
              ),
              child: Text(
                "تطبيق حاوِر هو أداة تهدف الى تحقيق التواصل بين متحدثي لغة الاشارة والاخرين من الاشخاص الغير متحدثين بها عن طريق استخدام تقنية التعرف على اشارات اليد وتحوليها الى نصوص مقروءة او مسموعة لتسهل عملية التواصل مع متحدثي لغة الاشارة وايضا توفير هائل للوقت المُستهلك والمجهود في عملية التواصل",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
