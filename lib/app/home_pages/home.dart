import 'package:flutter/material.dart';
import 'package:hawer_app/app/Saved_Items/saved.dart';
import 'package:hawer_app/app/home_pages/record_pages/show_video.dart';
import 'package:hawer_app/app/home_pages/upload_pages/upload_main.dart';
import 'package:hawer_app/app/settings_pages/settings.dart';
import '../../core/constants.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Settings(),
                      ),
                    );
                  },
                  child: Image.asset("images/Settings.png")),
              GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Saved(),
                      ),
                    );
                  },
                  child: Image.asset("images/Bookmark.png")),
              GestureDetector(
                  onTap: (){
                  },
                  child: Image.asset("images/Home.png")),
            ],
          ),
        ),
      ),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("اختر الطريقة المناسبة لك ",style: TextStyle(fontSize: 22),),
          const Text(" لإدخال الفيديو",style: TextStyle(fontSize: 22),),
          const SizedBox(height: 100,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const Showvideo(),
                ),
              );
            },
              child: Image.asset("images/Group 2.png")),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const Uploadmain(),
                ),
              );

            },
              child: Image.asset("images/Group 1.png")),
        ],
      ),),
    );
  }
}
