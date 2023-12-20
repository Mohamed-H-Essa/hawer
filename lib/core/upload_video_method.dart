import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<String> uploadVideo(File videoFile) async {
  try {
    debugPrint(" Uploading video...");
    Dio dio = Dio();
    String uploadUrl =
        'https://flask-nn-qyu5kdlwya-uc.a.run.app/'; // Replace with your actual upload endpoint

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        videoFile.path,
        filename: 'uploaded_video.mp4',
      ),
    });

    print("Right before calling post..");
    final res = await dio.post(uploadUrl, data: formData);
    print(res);
    return res.data['message'];
    print('Video uploaded successfully');
  } catch (error) {
    print('Error uploading video: $error');
    return "Error uploading video: $error";
  }
}
