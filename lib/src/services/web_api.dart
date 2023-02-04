import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_app/src/models/youtube_response.dart';

class WebApiServices {
  Future<List<YoutubeElement>> feed() async {
    final dio = Dio();
    final result = await dio.get(
        "https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");
    final youtubeResponse = youtubeFromJson(result.data);
    print(youtubeResponse.youtubes[0].title);
    return youtubeResponse.youtubes;
  }
}
