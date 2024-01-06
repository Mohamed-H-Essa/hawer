import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

Future<Either<String, String>> uploadVideo(File videoFile) async {
  try {
    // return Left("Error uploading video: ");
    debugPrint(" Uploading video...");
    Dio dio = Dio();
    String uploadUrl =
        'https://model-flask-tleoxgdzsq-lm.a.run.app/'; // Replace with your actual upload endpoint

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        videoFile.path,
        filename: 'uploaded_video.mp4',
      ),
    });

    print("Right before calling post..");
    final res = await dio.post(uploadUrl, data: formData);
    print(res);
    if (res.statusCode != 200) {
      return Left("Error uploading video: ${res.data['message']}");
    }

    print('Video uploaded successfully');
    return Right(res.data['message']);
  } catch (error) {
    print('Error uploading video: $error');
    return Left("Error uploading video: $error");
  }
}
