import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> sendFeedback(String correctWords, File vide) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? relativePath = prefs.getString('videoPath');
  print(relativePath);
  print(correctWords);
  print(vide.path);
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://quranic-dictionary.herokuapp.com/feedback/'));
  request.files.add(await http.MultipartFile.fromPath('video', vide.path));
  request.fields['correct_words'] = correctWords;
  request.fields['video_path'] = relativePath!;
  var res = await request.send();
  print(res.statusCode);
  print(res.reasonPhrase);
  print(res.contentLength);
  print(res.headers);
  print(res.request);

  if (res.statusCode == 200) {
    print('Uploaded!');
  } else {
    print('Upload failed!');
  }
}
