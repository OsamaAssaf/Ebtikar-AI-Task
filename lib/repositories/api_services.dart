import 'package:http/http.dart' as http;

import 'package:ebtikar_ai_task/resources/helpers/all_imports.dart';

class ApiServices {
  ApiServices._();

  static final _instance = ApiServices._();

  factory ApiServices() => _instance;

  Future<({int statusCode, dynamic decodedBody})> get({
    required String endpoint,
    bool shouldCheck = true,
  }) async {
    final String url = '${DotenvManager.apiPath}/$endpoint';
    final http.Response response = await http
        .get(
      Uri.parse(url),
      headers: _getHeaders(),
    )
        .timeout(
      ExceptionManager().timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    final int statusCode = response.statusCode;
    final dynamic decodedBody = jsonDecode(response.body);
    if (shouldCheck) {
      ExceptionManager().checkExceptions(statusCode, decodedBody);
    }
    return (statusCode: statusCode, decodedBody: decodedBody);
  }

  Future<({int statusCode, dynamic decodedBody})> post({
    required String endpoint,
    required String body,
    bool shouldCheck = true,
  }) async {
    final String url = '${DotenvManager.apiPath}/$endpoint';
    final http.Response response = await http
        .post(
      Uri.parse(url),
      body: body,
      headers: _getHeaders(),
    )
        .timeout(
      ExceptionManager().timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    final int statusCode = response.statusCode;
    final dynamic decodedBody = jsonDecode(response.body);
    if (shouldCheck) {
      ExceptionManager().checkExceptions(statusCode, decodedBody);
    }
    return (statusCode: statusCode, decodedBody: decodedBody);
  }

  Future<({int statusCode, dynamic decodedBody})> put({
    required String endpoint,
    required String body,
    bool shouldCheck = true,
  }) async {
    final String url = '${DotenvManager.apiPath}/$endpoint';
    final http.Response response = await http
        .put(
      Uri.parse(url),
      body: body,
      headers: _getHeaders(),
    )
        .timeout(
      ExceptionManager().timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    final int statusCode = response.statusCode;
    final dynamic decodedBody = jsonDecode(response.body);
    if (shouldCheck) {
      ExceptionManager().checkExceptions(statusCode, decodedBody);
    }
    return (statusCode: statusCode, decodedBody: decodedBody);
  }

  Future<({int statusCode, dynamic decodedBody})> delete({
    required String endpoint,
    bool shouldCheck = true,
  }) async {
    final String url = '${DotenvManager.apiPath}/$endpoint';
    final http.Response response = await http
        .delete(
      Uri.parse(url),
      headers: _getHeaders(),
    )
        .timeout(
      ExceptionManager().timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    final int statusCode = response.statusCode;
    final dynamic decodedBody = jsonDecode(response.body);
    if (shouldCheck) {
      ExceptionManager().checkExceptions(statusCode, decodedBody);
    }
    return (statusCode: statusCode, decodedBody: decodedBody);
  }

  static Map<String, String> _getHeaders() {
    // final UserModel? userModel = Globals().userModel;
    final Map<String, String> headers = {
      'Accept-Language': localizations.localeName,
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json; charset=UTF-8',
    };
    // if (userModel?.jwtToken != null) {
    //   headers['Authorization'] = 'Bearer ${userModel!.jwtToken!}';
    // }
    return headers;
  }
}
