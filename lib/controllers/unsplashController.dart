// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/client.dart';
import 'package:to_do_app/models/image_model.dart';
import 'package:unsplash_client/unsplash_client.dart';

class UnsplashController {
  Future<String> getRandomPhoto(String keyword) async {
    String url =
        'https://api.unsplash.com/photos/random/?client_id=${client.settings.credentials.accessKey}&count=1&query=$keyword';
    var data = await _getImageData(url);
    print("DATA OBJECT ---> ${data[0].urls.regular}");
    return data[0].urls.regular;
  }

  static dynamic _getImageData(String url) async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Authorization', 'Client-ID $applicationID}');
    print("Request header ----> ${request.headers}");
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
