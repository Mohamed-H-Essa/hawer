import 'package:flutter/material.dart';
import 'package:hawer_app/app/Saved_Items/saved_page.dart';
import 'package:hawer_app/app/settings_pages/settings.dart';
import '../core/constants.dart';
import 'home_pages/home.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);
  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentIndex = 2;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late List pages = [
    const Settings(),
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
