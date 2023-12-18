import 'package:flutter/material.dart';
import '../../../core/constants.dart';
class Feedback3 extends StatefulWidget {
  // final File? image;
  const Feedback3({Key? key}) : super(key: key) ;

  @override
  State<Feedback3> createState() => _Feedback3State();
}

class _Feedback3State extends State<Feedback3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 256,),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Image(image: AssetImage("images/video.png")),
              ],

            ),
            const SizedBox(
              height: 185,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffA7B6CC)),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffA7B6CC), width: 2.0),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  filled: true,
                  hintStyle: const TextStyle(color: Color(0xffA7B6CC)),
                  hintText: "ادخل معنى الكلمة",
                  fillColor: Colors.white70,
                ),
              ),
            ),

            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30),
              child: MaterialButton(onPressed: (){

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
                    (Text("ارسال",style: TextStyle(fontSize: 17.28,color: Colors.white),)),
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
