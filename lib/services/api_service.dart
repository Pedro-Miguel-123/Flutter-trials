import 'package:dio/dio.dart';

class ApiService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then((value) {
      return value;
    });
  }
}
