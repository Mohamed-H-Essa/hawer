import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/home_pages/record_pages/result_video_screen.dart';
import 'package:hawer_app/app/home_pages/record_pages/video_player_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants.dart';
import '../../core/sql/sql_helper.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);
  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  // bool _showCheckboxes = true;
  bool loading = true;
  String dirPath = '';
  List<SavedItem>? savedList;
  // bool _throwShotAway=true;
  @override
  void initState() {
    super.initState();
    getSavedVideos().then((value) {
      savedList = value;
      setState(() {
        loading = false;
      });
    });
    // loadPathVideo();
  }

  Future<void> loadPathVideo() async {
    loading = true;
    print('loading...');
    final Directory extDir = await getApplicationDocumentsDirectory();

    //get videoPath from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? videoPath = prefs.getString('videoPath');

    setState(() {
      dirPath = '${extDir.path}/$videoPath';
      print(videoPath!.split('/')[1]);
      if (videoPath == null || videoPath.isEmpty) {
        loading = true;
        return;
      }
      print(dirPath);
      loading = false;
      print('loading donee');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "المحفوظ",
          style: TextStyle(fontSize: 22),
        ),
        leading: const SizedBox(),
        backgroundColor: Constants.darkBlue,
      ),
      body: loading || savedList == null
          ? const CircularProgressIndicator()
          : savedList!.isEmpty
              ? const Center(
                  child: Text(
                    'لا يوجد فيديوهات محفوظة',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 37),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: ListView.builder(
                      itemCount: savedList!.length,
                      itemBuilder: (context, index) {
                        String word = savedList![index].word;
                        String date = savedList![index].date;

                        // convert date to human readable format
                        date = date.split('.')[0].replaceAll('T', ' ');

                        return GestureDetector(
                          onLongPress: () {
                            setState(() {});
                          },
                          child: buildListTile("images/image.png", word, date,
                              savedList![index].videoPath),
                        );
                      },
                    ),
                  ),
                ),
    );
  }

  ListTile buildListTile(image, title, subtitle, path) {
    return ListTile(
        title: Text(
          title,
          //textDirection: TextDirection.ltr,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        leading: ImagePreview(dirPath: path),
        // trailing: _showCheckboxes?Checkbox(value: _throwShotAway,
        //   onChanged: (bool? newValue) {
        //     setState(() {
        //       _throwShotAway = newValue!;
        //     });
        //   },
        // ):Container(),
        focusColor: Colors.grey,
        hoverColor: Colors.grey,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultVideoScreen(
                videoPath: path,
                resultMessage: title,
                fromSaved: true,
              ),
            ),
          );
        });
  }
}

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required this.dirPath,
  });

  final String dirPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 120,
      child: VideoPlayerWidget(
        videoPath: dirPath,
        isBytes: true,
        playable: false,
      ),
    );
  }
}
