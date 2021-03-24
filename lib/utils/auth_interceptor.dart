import 'dart:io';

import 'package:blog/utils/utils.dart';

import '../services/services.dart';
import 'package:blog/utils/locator.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.path.contains('login')) {
      var token = locator
          .get<SharedPreferenceService>()
          .getStringFromSharedPref(tokenKey);
      if (token != null) {
        options.headers[HttpHeaders.authorizationHeader] = token;
      }
    }
    return super.onRequest(options, handler);
  }
}
