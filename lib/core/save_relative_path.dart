import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveRelativePath(String videoPath) async {
  // save video path to shared preferences after removing the first part of the path and prefixing it with 'Movies/'

  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(videoPath);
  // String relativePath = videoPath.split('/')[6];
  // set relative path to what's after the word 'cache/'
  String relativePath = videoPath.split('cache/')[1];

  relativePath = 'Movies/' + relativePath;
  print(relativePath);

  await prefs.setString('videoPath', relativePath);
}
