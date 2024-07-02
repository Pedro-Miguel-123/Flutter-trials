// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/client.dart';
import 'package:to_do_app/models/image_model.dart';

class UnsplashController {
  Future<String> getRandomPhoto(String keyword) async {
    String url =
        'https://api.unsplash.com/photos/random/?client_id=${client.settings.credentials.accessKey}&count=1&query=$keyword';
    var data = await _getImageData(url);
    if (data.length > 0) {
      return data[0].urls.regular;
    } else {
      return "https://images.unsplash.com/photo-1655366182094-33cf0411a60b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2Mjg2Njh8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MTk5MzE5OTF8&ixlib=rb-4.0.3&q=80&w=1080";
    }
  }

  static dynamic _getImageData(String url) async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Authorization', 'Client-ID $applicationID}');
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String json = await response.transform(utf8.decoder).join();
      List<dynamic> result = jsonDecode(json);
      List<ImageModel> images =
          result.map((e) => ImageModel.fromJson(e)).toList();
      return images;
    } else {
      if (kDebugMode) {
        print("Http error: ${response.statusCode}");
      }
      return [];
    }
  }
}
