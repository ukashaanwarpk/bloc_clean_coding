import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_clean_coding/data/exception/app_exception.dart';
import 'package:bloc_clean_coding/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout((const Duration(seconds: 20)));

      jsonResponse = returnReponse(response);

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
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout((const Duration(seconds: 20)));

      jsonResponse = returnReponse(response);

      return jsonResponse;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException();
    }
  }

  dynamic returnReponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body.toString());
        return jsonResponse;
      case 400:
        throw BadRequestException();

      case 401:
        throw UnauthorisedException();

      case 500:
        throw FetchDataException();
    }
  }
}
