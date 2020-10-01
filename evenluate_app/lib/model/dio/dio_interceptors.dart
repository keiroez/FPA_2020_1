import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:evenluate_app/model/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.headers['authorization'] = 'JWT ${Constants.USER_TOKEN}';
    options.headers['content-Type'] = 'application/json';
    if (options.extra.containsKey("refresh")) {
      if (options.extra['refresh']) {
        return options;
      } else {
        return getCache(options.uri.toString());
      }
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    await saveCache(response);
    return response;
  }

  @override
  onError(DioError err) async {
    print("ERROR: ${err.type} PATH: ${err.request.path}");
    if (err.type == DioErrorType.CONNECT_TIMEOUT ||
        err.type == DioErrorType.DEFAULT) {
      final cache = getCache(err.request.uri.toString());
      if (cache != null) {
        return cache;
      }
    }
    print(err.toString());
    return err;
  }

  saveCache(Response response) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('${response.request.uri}', jsonEncode(response.data));
    saveDate(response.request.uri.toString());
  }

  saveDate(String uri) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('date: $uri', DateTime.now().toString());
  }

  Future<DateTime> getDate(String uri) async {
    final prefs = await SharedPreferences.getInstance();

    DateTime date;
    if (prefs.containsKey('date: $uri')) {
      date = DateTime.parse(prefs.get('date: $uri'));
    }
    return date;
  }

  getCache(String uri) async {
    final prefs = await SharedPreferences.getInstance();

    final date = await getDate(uri);
    if (date != null) {
      final diff = DateTime.now().difference(date).inMinutes;
      if (prefs.containsKey(uri) && diff < 60) {
        var res = jsonDecode(prefs.getString(uri));
        return Response(data: res, statusCode: 200);
      } else {
        prefs.clear();
      }
    }
    return null;
  }
}
