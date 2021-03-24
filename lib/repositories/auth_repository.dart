import 'dart:convert';
import 'dart:developer';

import 'package:blog/models/models.dart';

import '../utils/utils.dart';

import '../services/services.dart';

class AuthRepo {
  final DioHttpClientService dioHttpClientService;

  AuthRepo(this.dioHttpClientService) : assert(dioHttpClientService != null);

  Future<LoginResponse> loginUser(String email, String password) async {
    try {
      var _payload = {"email": email, "password": password};

      var _response = await dioHttpClientService.post(loginUrl, data: _payload);
      log("status code---- ${_response.statusCode}");
      if (_response.statusCode != 201) {
        throw _response.data ?? "Something went wrong";
      }
      return LoginResponse.fromJson(
          json.decode((json.encode(_response.data)).toString()));
    } catch (e) {
      throw e.toString() ?? "Something went wrong";
    }
  }
}
