import 'package:dio/dio.dart';

class WebApiServices {
  Future<void> feed() async {
    final dio = Dio();
    final result = await dio.get(
        "https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");
    print(result.data);
  }
}
