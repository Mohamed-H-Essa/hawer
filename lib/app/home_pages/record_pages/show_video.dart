import 'package:flutter/material.dart';
import 'package:hawer_app/app/home_pages/record_pages/save_video.dart';

import '../../../core/constants.dart';
class Showvideo extends StatefulWidget {
 // final File? image;
  const Showvideo({Key? key}) : super(key: key) ;

  @override
  State<Showvideo> createState() => _ShowvideoState();
}

class _ShowvideoState extends State<Showvideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 207,),
          const Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("images/video.png")),
            ],

          ),
          const SizedBox(
              height: 300,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: MaterialButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const Savevideo(),
                ),
              );

            },
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                  side: BorderSide.none),
              color: Constants.darkBlue,
              height: 60,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (Text("التالي",style: TextStyle(fontSize: 17.28,color: Colors.white),)),
                ],
              ),

            ),
          ),


        ],
      ),
    );
  }
}
