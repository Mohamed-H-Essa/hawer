import 'package:flutter/material.dart';
import 'package:hawer_app/app/Saved_Items/saved_page.dart';
import 'package:hawer_app/app/home_pages/record_pages/result_screen.dart';
import 'package:hawer_app/app/home_pages/upload_pages/upload_camera.dart';
import 'package:hawer_app/app/home_pages/upload_pages/upload_from_gallery.dart';
import 'package:hawer_app/app/settings_pages/settings.dart';
import 'package:hawer_app/core/transition_animation.dart';
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
          Settings(),
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

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UploadFromGallery(),
                ),
              );
            },
            child: Image.asset("images/Group 1.png"),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:hawer_app/app/Saved_Items/saved.dart';
// import 'package:hawer_app/app/home_pages/record_pages/result_screen.dart';
// import 'package:hawer_app/app/home_pages/upload_pages/upload_camera.dart';
// import 'package:hawer_app/app/home_pages/upload_pages/upload_from_gallery.dart';
// import 'package:hawer_app/app/settings_pages/settings.dart';
// import 'package:hawer_app/core/transition_animation.dart';
// import '../../core/constants.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           height: 60,
//           width: 90,
//           color: Constants.darkBlue,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MyCustomRoute(
//                         builder: (context) => const Settings(),
//                       ),
//                     );
//                   },
//                   child: Image.asset("images/Settings.png")),
//               GestureDetector(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const Saved(),
//                       ),
//                     );
//                   },
//                   child: Image.asset("images/Bookmark.png")),
//               GestureDetector(
//                   onTap: () {}, child: Image.asset("images/Home.png")),
//             ],
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "اختر الطريقة المناسبة لك ",
//               style: TextStyle(fontSize: 22),
//             ),
//             const Text(
//               " لإدخال الفيديو",
//               style: TextStyle(fontSize: 22),
//             ),
//             const SizedBox(
//               height: 100,
//             ),
//             GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       // todo
//                       // builder: (context) => const ResultScreen(), //!!!!!!!1 /

//                       builder: (context) => UploadUsingCamera(),
//                     ),
//                   );
//                 },
//                 // from camera
//                 child: Image.asset("images/Group 2.png")),
//             const SizedBox(
//               height: 15,
//             ),
//             GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const UploadFromGallery(),
//                     ),
//                   );
//                 },
//                 // from device
//                 child: Image.asset("images/Group 1.png")),
//           ],
//         ),
//       ),
//     );
//   }
// }
