import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/settings_pages/settings.dart';

import '../../core/constants.dart';
import '../Saved_Items/saved.dart';
import '../home_pages/home.dart';
class OurVision extends StatefulWidget {
  const OurVision({Key? key}) : super(key: key);

  @override
  State<OurVision> createState() => _OurVisionState();
}

class _OurVisionState extends State<OurVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text ("رؤيتنا",style: TextStyle(fontSize:22),),
        actions: [Padding(
          padding: const EdgeInsets.only(left: 15.0),
            child: IconButton(icon: const Icon(CupertinoIcons.arrow_left), onPressed: () { Navigator.pop(context); },)
        )],
         leading: const SizedBox(),
        backgroundColor: Constants.darkBlue,
      ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Settings(),
                      ),
                    );
                  },
                  child: Image.asset("images/Settings.png")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Saved(),
                      ),
                    );
                  },
                  child: Image.asset("images/Bookmark.png")),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Home(),
                      ),
                    );
                  },
                  child: Image.asset("images/Home.png")),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 34,),
             Padding(
               padding: EdgeInsets.only(right:22,left: 23),
               child: Text("تأهيل المجتمع على التعامل السَّلس والسليم مع متحدثي لغة الاشارة واعطائهم حقوقهم التي تكفل حياة انسانية كريمة تجعل منهم اشخاص قادرين على الاندماج في المجتمع مما يتيح الاستفادة من قدراتهم ومواهبهم وتبادل الثقة بينهم وبين البيئة المحيطة الذي ينتج عنه التنوع في الانتاج والتميّز والإبداع في شتَّى مناحي الحياة"
                 ,style: TextStyle(fontSize: 16),),
             ),

          ],),
      ),

    );
  }
}
