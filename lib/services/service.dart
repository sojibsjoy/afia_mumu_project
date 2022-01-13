import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class BaseClient {
  static const int timeOutDuration = 20;
  // GET
  Future<dynamic> get(String baseUrl, String api, dynamic hdrs) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(uri, headers: hdrs).timeout(
            const Duration(
              seconds: timeOutDuration,
            ),
          );
      return _processResponse(response);
    } on SocketException {
      return "";
    } on TimeoutException {
      return "";
    }
  }

  // DELETE
  // OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      default:
        return "";
    }
  }
}
