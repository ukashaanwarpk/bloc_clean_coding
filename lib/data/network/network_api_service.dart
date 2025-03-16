import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_clean_coding/config/components/log.dart';
import 'package:bloc_clean_coding/data/exception/app_exception.dart';
import 'package:bloc_clean_coding/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService with LoggerMixin implements BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout((const Duration(seconds: 20)));

      jsonResponse = returnReponse(response);
      logMessage('jsonResponse: $jsonResponse');

      return jsonResponse;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException();
    }
  }

  @override
  Future postApi(String url, dynamic data) async {
    dynamic jsonResponse;

    logMessage('url: $url');
    logMessage('data: $data');

    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout((const Duration(seconds: 20)));

      jsonResponse = returnReponse(response);
      logMessage('jsonResponse: $jsonResponse');

      return jsonResponse;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException();
    }
  }

  dynamic returnReponse(http.Response response) {
    logMessage('status code: ${response.statusCode}');

    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body.toString());
        return jsonResponse;
      case 400:
         dynamic jsonResponse = jsonDecode(response.body.toString());
        return jsonResponse;

      case 401:
        throw UnauthorisedException();

      case 500:
        throw FetchDataException();
    }
  }
}
