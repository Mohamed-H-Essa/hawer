import 'package:flutter/material.dart';
import 'package:hawer_app/app/home/view/main_page.dart';
import 'package:hawer_app/app/saved/view/saved_page.dart';
import 'package:hawer_app/app/info/info_screen.dart';
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
