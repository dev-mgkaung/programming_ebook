import 'package:http/http.dart' as http;
import 'package:programmingebook/constraints/constraints.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:programmingebook/services/networks/custom_exception.dart';

class ApiProvider {

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}