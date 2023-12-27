import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/app/home_pages/record_pages/v2_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants.dart';
import '../home_pages/home.dart';
import '../settings_pages/settings.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);
  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  // bool _showCheckboxes = true;
  bool loading = true;
  String dirPath = '';
  // bool _throwShotAway=true;
  @override
  void initState() {
    super.initState();
    load_path_video();
  }

  Future<void> load_path_video() async {
    loading = true;
    print('loading...');
    final Directory extDir = await getApplicationDocumentsDirectory();

    //get videoPath from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? videoPath = prefs.getString('videoPath');

    setState(() {
      dirPath = '${extDir.path}/$videoPath';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 37),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView.builder(
            // itemCount: 100,
            itemBuilder: (context, index) {
              //todo:Add video player
              // if (index == 0 && loading == false) {
              //   return Container(
              //     color: Colors.red,
              //     height: 20,
              //     child: VideoWidget(
              //       videoPath: dirPath,
              //     ),
              //   );
              // }
              return GestureDetector(
                onLongPress: () {
                  setState(() {});
                },
                child: buildListTile(
                    "images/image.png",
                    "${index % 3 == 0 ? "Hello" : "Pleased"} ${index % 2 == 0 ? "hi" : ""} ${index % 4 == 0 ? "Thanks" : ""}  ${index % 5 == 0 ? "Pleased" : "word"} ",
                    "December 2${(index + index * 19) % 9}, 2023 ${(index * 3) % 5}${(index * 4) % 5}:${(index * 4) % 5}${(index * 3) % 5} AM"),
              );
            },
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(image, title, subtitle) {
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
        leading: Image.asset(image),
        // trailing: _showCheckboxes?Checkbox(value: _throwShotAway,
        //   onChanged: (bool? newValue) {
        //     setState(() {
        //       _throwShotAway = newValue!;
        //     });
        //   },
        // ):Container(),
        focusColor: Colors.grey,
        hoverColor: Colors.grey,
        onTap: () {});
  }
}
