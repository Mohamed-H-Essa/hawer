import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hawer_app/app/home/upload_camera/video_player_widget.dart';
import 'package:hawer_app/core/constants.dart';
import 'package:hawer_app/core/sql/sql_helper.dart';

class ResultSuccessVideoScreen extends StatefulWidget {
  ResultSuccessVideoScreen({
    super.key,
    required this.videoPath,
    required this.resultMessage,
    SavedItem? item,
    this.fromSaved = false,
    this.edit = false,
    this.feedback = false,
  }) : item = item ??
            SavedItem(
              id: 0,
              videoPath: videoPath,
              word: resultMessage,
              date: DateTime.now().toIso8601String(),
            );

  final SavedItem item;
  final String videoPath;
  final String resultMessage;
  final bool fromSaved;
  final bool edit;
  final bool feedback;

  @override
  // ignore: library_private_types_in_public_api
  _ResultSuccessVideoScreenState createState() =>
      _ResultSuccessVideoScreenState();
}

class _ResultSuccessVideoScreenState extends State<ResultSuccessVideoScreen> {
  bool isSaved = false;
  String snackMessage = "";
  String newMessage = '';
  final FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    super.initState();

    // Show the alert dialog after a delay when the screen is loaded
    widget.fromSaved || widget.edit
        ? null
        : Future.delayed(
            const Duration(
              seconds: 5,
            ), () {
            _showAlertDialog(context, 'This is an alert!');
          });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
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
                            "برجاء كتابه الجمله صحيحه لأرسالها للمطور:",
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
                  height: 540,
                  padding: const EdgeInsets.only(top: 20),
                  // child: VideoDisplayWidget(
                  //   videoPath: widget.videoPath,
                  // ),
                  child: VideoPlayerWidget(
                    videoPath: widget.videoPath,
                    isBytes: widget.fromSaved,
                  ),
                ),
                !widget.edit
                    ? FilledButton(
                        onPressed: () {
                          flutterTts.speak(widget.resultMessage);
                        },
                        child: const Text('شغل'))
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 189, 225, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: widget.edit
                      ? TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'اكتب هنا',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          onChanged: (value) {
                            setState(() {
                              newMessage = value;
                            });
                          },
                        )
                      : Text(
                          widget.resultMessage,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: widget.fromSaved || widget.edit
                        ? const SizedBox()
                        : MaterialButton(
                            onPressed: widget.resultMessage.isEmpty
                                ? null
                                : () async {
                                    if (widget.resultMessage.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('لا يوجد نتيجة'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                      return;
                                    }

                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(isSaved
                                            ? 'تم الحفظ بالفعل'
                                            : 'جاري الحفظ'),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );

                                    if (isSaved) return;
                                    File(widget.videoPath)
                                        .readAsBytes()
                                        .then((value) => {
                                              saveVideoToDB(
                                                      widget.resultMessage,
                                                      value)
                                                  .then((value) {
                                                isSaved = true;
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text('تم الحفظ'),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              })
                                            });
                                  },
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                                side: BorderSide.none),
                            color: Constants.darkBlue,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.resultMessage.isEmpty
                                    ? const Text('لا يوجد نتيجه')
                                    : const Text(
                                        "حفظ",
                                        style: TextStyle(
                                            fontSize: 17.28,
                                            color: Colors.white),
                                      ),
                              ],
                            ),
                          )),
                widget.edit
                    ? FilledButton(
                        onPressed: newMessage.isEmpty
                            ? null
                            : () {
                                ScaffoldMessenger.of(context).clearSnackBars();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('جاري الحفظ'),
                                  duration: Duration(seconds: 2),
                                ));

                                SavedItem i =
                                    widget.item.copyWith(word: newMessage);
                                updateSavedItem(i);

                                ScaffoldMessenger.of(context).clearSnackBars();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('تم الحفظ'),
                                  duration: Duration(seconds: 2),
                                ));
                                Future.delayed(
                                    const Duration(milliseconds: 400), () {
                                  Navigator.of(context).pop();
                                });
                              },
                        child: Text(
                            widget.feedback ? "أرسال للمطور" : "حفظ التغييرات"))
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          //SizedBox(height: 20),
        ),
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
      try {
        // Overlay.of(context).remove(overlayEntry) ;
        overlayEntry.remove();
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
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
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => ResultSuccessVideoScreen(
                          videoPath: widget.videoPath,
                          resultMessage: widget.resultMessage,
                          edit: true,
                          feedback: true,
                        )));
              },
              child: Text(
                'يوجد',
                style: TextStyle(color: Constants.darkBlue, fontSize: 14),
              ),
            ),
          ],
        );
      },
    );
  }
}
