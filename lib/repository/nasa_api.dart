import 'dart:convert';

import 'package:dio/dio.dart';

class NasaAPI{
  final dio = Dio();

  Future<List<String>> get_images_APOD() async {
    var result = await dio.get("https://api.nasa.gov/planetary/apod?api_key=T78WjVX9Tspt6b0UEDNjw8dwYKvkh1aefiNubJRd&count=10");
    if (result.statusCode != 200){
      return [];
    }
    List<dynamic> body = result.data;
    if (body.isEmpty){
      return [];
    }
    List<String> images = [];
    for (int i = 0; i < body.length; i++){
      var elem = body[i];
      if (elem["hdurl"] != "file:///null"){
        images.add(elem["hdurl"]);
      }
    }
    print(images);
    return images;
  }
}