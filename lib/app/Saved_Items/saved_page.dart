import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/Saved_Items/saved_selected_mode.dart';
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
  bool loading = true;
  String dirPath = '';
  @override
  void initState() {
    super.initState();
    getSavedVideos().then((value) {
      savedList = value;
      setState(() {
        loading = false;
      });
    });
  }

  Future<void> loadPathVideo() async {
    loading = true;
    final Directory extDir = await getApplicationDocumentsDirectory();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? videoPath = prefs.getString('videoPath');
    setState(() {
      dirPath = '${extDir.path}/$videoPath';
      if (videoPath == null || videoPath.isEmpty) {
        loading = true;
        return;
      }
      loading = false;
    });
  }

  List<SavedItem>? savedList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: const Text(
          "المحفوظ",
          style: TextStyle(fontSize: 22),
        ),
        leading: const SizedBox(),
        backgroundColor: Constants.darkBlue,
      ),
      body: loading || savedList == null
          ? const Center(child: CircularProgressIndicator())
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
                        date = date.split('.')[0].replaceAll('T', ' ');
                        return buildListTile(
                          "images/image.png",
                          word,
                          date,
                          savedList![index].videoPath,
                          index,
                          savedList![index],
                        );
                      },
                    ),
                  ),
                ),
    );
  }

  ListTile buildListTile(image, title, subtitle, path, index, SavedItem item) {
    return ListTile(
        onLongPress: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SavedSelectedModeScreen(initIndex: index),
            ),
          );
          setState(() {
            loading = true;
          });

          getSavedVideos().then((value) {
            savedList = value;
            setState(() {
              loading = false;
            });
          });
        },
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
        leading: ImagePreview(dirPath: path),
        focusColor: Colors.grey,
        hoverColor: Colors.grey,
        splashColor: const Color.fromARGB(255, 179, 182, 255),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultVideoScreen(
                item: item,
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
    return SizedBox(
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
