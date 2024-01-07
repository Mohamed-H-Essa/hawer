import 'package:flutter/material.dart';
import 'package:hawer_app/app/saved/saved_page.dart';
import 'package:hawer_app/app/info/settings.dart';
import '../core/constants.dart';
import 'home/home.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int currentIndex = 2;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late List pages = [
    const InfoScreen(),
    const SavedScreen(),
    const Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 41,
          showSelectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          backgroundColor: Constants.darkBlue,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("images/Settings.png"), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("images/Bookmark.png"), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("images/Home.png"), label: ""),
          ],
        ));
  }
}
