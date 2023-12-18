import 'package:flutter/material.dart';
import 'package:hawer_app/core/constants.dart';
import 'package:video_player/video_player.dart';
class Savevideo extends StatefulWidget {
  const Savevideo({super.key});

  @override
  _SavevideoState createState() => _SavevideoState();
}

class _SavevideoState extends State<Savevideo> {
  VideoPlayerController? _videoController;
  @override
  void initState() {
    super.initState();

    // Show the alert dialog after a delay when the screen is loaded
    Future.delayed(Duration.zero, () {
      _showAlertDialog(context, 'This is an alert!');
    });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text("نتيجة العملية :",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Constants.darkBlue),)),
                ],
              ),
            ),
            const SizedBox(height: 537,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30),
              child: MaterialButton(onPressed: (){
                _showCustomDialog(context);

               // showCenterSnackBar(context, 'تم الحفظ بنجاح');

                // final snackBar = SnackBar(
                //   backgroundColor: Color(0xff07A304),
                //   content: Text('تم الحفظ بنجاح',style: TextStyle(fontSize: 14,color: Colors.white),),
                //   duration: Duration(seconds: 2),
                //   behavior: SnackBarBehavior.floating,
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                    (Text("حفظ",style: TextStyle(fontSize: 17.28,color: Colors.white),)),
                  ],
                ),

              ),
            ),
        ],
            ),
            //SizedBox(height: 20),



      ),
    );
  }
  void showCenterSnackBar(BuildContext context, String message) {
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).size.height / 2 - 50.0,
        left: MediaQuery.of(context).size.width / 13,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 330,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: const BoxDecoration(
              color: Color(0xff07A304),
              //borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(fontSize: 14,color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // Display the SnackBar for a few seconds
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
  void _showAlertDialog(BuildContext context, String message) {
    // Show the alert dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: Text('اذا واجهت خطأ في العملية الخاصة بك يمكنك ارسال ملاحظاتك لفريق التطوير الخاص بنا.',style: TextStyle(color: Constants.darkBlue,fontSize: 14),),

          actions: <Widget>[
            TextButton(
              onPressed: () {
              },
              child: Text('لا يوجد',style: TextStyle(color: Constants.darkBlue,fontSize: 14),),
            ),
            TextButton(
              onPressed: () {
              },
              child: Text('يوجد',style: TextStyle(color: Constants.darkBlue,fontSize: 14),),
            ),
          ],
        );
      },
    );

    // Delay for 5 seconds and then close the dialog
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
  }
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff07A304),
                // borderRadius: BorderRadius.circular(16.0),
              ),
              width: 500.0, // Adjust the width as needed
              height: 50.0, // Adjust the height as needed
              child:const Center(
                child: Text("تم الحفظ بنجاح",style: TextStyle(fontSize: 14,color: Colors.white),),
              )
          ),
        );

      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }


}

