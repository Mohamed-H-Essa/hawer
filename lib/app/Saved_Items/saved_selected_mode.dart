import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/home_pages/record_pages/result_video_screen.dart';
import 'package:hawer_app/app/home_pages/record_pages/video_player_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants.dart';
import '../../core/sql/sql_helper.dart';

class SavedSelectedModeScreen extends StatefulWidget {
  const SavedSelectedModeScreen({
    Key? key,
    required this.initIndex,
  }) : super(key: key);

  final int initIndex;

  @override
  State<SavedSelectedModeScreen> createState() =>
      _SavedSelectedModeScreenState();
}

class _SavedSelectedModeScreenState extends State<SavedSelectedModeScreen> {
  // bool _showCheckboxes = true;
  bool loading = true;
  String dirPath = '';
  List<SavedItem>? savedList;
  // bool _throwShotAway=true;
  @override
  void initState() {
    super.initState();

    print('naved to selected mode');
    selectedIndexes = [widget.initIndex];
    getSavedVideos().then((value) {
      savedList = value;
      // SavedList.of(context)!.savedItems = value;
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

  List<int> selectedIndexes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leadingWidth: 0,
        title: const Text(
          "المحدد",
          style: TextStyle(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            setState(() {
              selectedIndexes = [];
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
            icon: const Icon(
              Icons.arrow_back,
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
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

                        // convert date to human readable format
                        date = date.split('.')[0].replaceAll('T', ' ');

                        return buildListTile(
                            "images/image.png",
                            word,
                            date,
                            savedList![index].videoPath,
                            selectedIndexes.contains(index),
                            index);
                      },
                    ),
                  ),
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
                  onTap: () {
                    // delete selected items
                    //loope over selected indexes

                    setState(() {
                      for (int i = 0; i < selectedIndexes.length; i++) {
                        // delete from database
                        deleteSavedItem(savedList![selectedIndexes[i]]);
                      }
                    });

                    // refresh list
                    getSavedVideos().then((value) {
                      savedList = value;
                      setState(() {
                        loading = false;
                      });
                    });
                  },
                  child: Image.asset("images/Delete.png")),
              GestureDetector(
                  // edit
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultVideoScreen(
                          item: savedList![selectedIndexes[0]],
                          videoPath: savedList![selectedIndexes[0]].videoPath,
                          resultMessage: savedList![selectedIndexes[0]].word,
                          fromSaved: true,
                          edit: true,
                        ),
                      ),
                    );
                    setState(() {
                      loading = true;
                    });
                    // refresh list
                    getSavedVideos().then((value) {
                      savedList = value;
                      setState(() {
                        loading = false;
                      });
                    });
                  },
                  child: Image.asset("images/Edit.png")),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(image, title, subtitle, path, bool selected, index) {
    return ListTile(
      selected: selected,
      selectedTileColor: Color.fromARGB(255, 224, 224, 224),
      title: Text(
        title,
        //textDirection: TextDirection.ltr,
        style: const TextStyle(fontSize: 20),
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
        setState(() {
          print(selectedIndexes);
          if (selectedIndexes.contains(index)) {
            selectedIndexes.remove(index);
          } else {
            selectedIndexes.add(index);
          }
          print(selectedIndexes);
        });
      },

      onLongPress: () {
        setState(() {
          print(selectedIndexes);
          if (selectedIndexes.contains(index)) {
            selectedIndexes.remove(index);
          } else {
            selectedIndexes.add(index);
          }
          print(selectedIndexes);
        });
      },
    );
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
