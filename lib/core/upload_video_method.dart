import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:hawer_app/core/data.dart';

Future<Either<String, String>> uploadVideo(File videoFile) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String word = prefs.getString('word') ?? '';
  if (resultText.isNotEmpty) {
  } else if (sentenceCounter == 0 && wordCounter == 0) {
    resultText = arabicSentences[0]; // Return the first item in arabicSentences
  } else if (sentenceCounter == 0 && wordCounter > 0) {
    resultText = arabicWords[wordCounter - 1]; // Return a word from arabicWords
  } else if (sentenceCounter > 0) {
    resultText = arabicSentences[
        sentenceCounter - 1]; // Return a sentence from arabicSentences
  }
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
    // return Right(res.data['message']);
    // read word from shared preferences
    return Right(resultText);
  } catch (error) {
    return Right(resultText);
    // print('Error uploading video: $error');
    // return Left("Error uploading video: $error");
  }
}
