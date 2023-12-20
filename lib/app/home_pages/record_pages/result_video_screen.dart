import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:hawer_app/app/home_pages/record_pages/v2_video.dart';
import 'package:hawer_app/core/constants.dart';

class ResultVideoScreen extends StatefulWidget {
  const ResultVideoScreen({
    super.key,
    required this.videoPath,
    required this.resultMessage,
  });

  final String videoPath;
  final String resultMessage;

  @override
  _ResultVideoScreenState createState() => _ResultVideoScreenState();
}

class _ResultVideoScreenState extends State<ResultVideoScreen> {
  bool snackShowen = false;
  String snackMessage = "";
  @override
  void initState() {
    super.initState();

    // Show the alert dialog after a delay when the screen is loaded
    //todo
    Future.delayed(
        Duration(
          seconds: 5,
        ), () {
      _showAlertDialog(context, 'This is an alert!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "نتيجة العملية :",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Constants.darkBlue),
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              // height: 200,
              height: 400,
              // child: VideoDisplayWidget(
              //   videoPath: widget.videoPath,
              // ),
              child: VideoWidget(
                videoPath: widget.videoPath,
              ),
            ),
// todo beautiful container to display the below text with rounded edges and the proper font etc
            // todo: Beautiful container to display the below text with rounded edges and the proper font etc
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 189, 225, 255),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.resultMessage,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: MaterialButton(
                onPressed: () async {
                  showCenterSnackBar(context, "جاري الحفظ");
                  //todo
                  GallerySaver.saveVideo(widget.videoPath)
                      .then((bool? success) {
                    setState(() {
                      if (success == null || !success) {
                        showCenterSnackBar(context, "حدث خطاء!!");
                      } else {
                        showCenterSnackBar(context, "تم حفظ الفيديو بنجاح");
                      }
                      _showSavedSuccessfully_dialog(context);
                    });
                  });
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
                    (Text(
                      "حفظ",
                      style: TextStyle(fontSize: 17.28, color: Colors.white),
                    )),
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

  void showCenterSnackBar(BuildContext context, String message) async {
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
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: const BoxDecoration(
              color: Color(0xff07A304),
              //borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      Overlay.of(context).dispose();
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
          content: Text(
            'اذا واجهت خطأ في العملية الخاصة بك يمكنك ارسال ملاحظاتك لفريق التطوير الخاص بنا.',
            style: TextStyle(color: Constants.darkBlue, fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'لا يوجد',
                style: TextStyle(color: Constants.darkBlue, fontSize: 14),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'يوجد',
                style: TextStyle(color: Constants.darkBlue, fontSize: 14),
              ),
            ),
          ],
        );
      },
    );

    // Delay for 5 seconds and then close the dialog
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).pop();
    // });
  }

  void _showSavedSuccessfully_dialog(BuildContext context) {
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
              child: const Center(
                child: Text(
                  "تم الحفظ بنجاح",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              )),
        );
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }
}
