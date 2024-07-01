// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/client.dart';
import 'package:unsplash_client/unsplash_client.dart';

class UnsplashController {
  Future<Photo> getRandomPhoto(String keyword) async {
    String url =
        'https://api.unsplash.com/search/photos?query=$keyword&page=1&per_page=1&order_by=popular';
    var data = await _getImageData(url);
    return data['results'][0];
  }

  static dynamic _getImageData(String url) async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.add('Authorization', 'Client-ID $applicationID}');

    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String json = await response.transform(utf8.decoder).join();
      return jsonDecode(json);
    } else {
      if (kDebugMode) {
        print("Http error: ${response.statusCode}");
      }
      return [];
    }
  }
}
