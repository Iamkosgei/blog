import 'dart:convert';

import 'package:blog/models/models.dart';
import 'package:dio/dio.dart';

import '../utils/utils.dart';

import '../services/services.dart';

class BlogRepo {
  final DioHttpClientService dioHttpClientService;

  BlogRepo(this.dioHttpClientService) : assert(dioHttpClientService != null);

  Future<List<Blog>> getBlogList() async {
    try {
      var _response = await dioHttpClientService.get(blogUrl);
      if (_response.statusCode != 200) {
        throw _response.data ?? "Something went wrong";
      }
      List list = json.decode(json.encode(_response.data));
      return list.map((e) => Blog.fromJson(e)).toList();
    } on DioError catch (e) {
      throw getError(e);
    } catch (e) {
      throw e.toString() ?? "Something went wrong";
    }
  }

  Future<Blog> getBlogEntry(String id) async {
    try {
      var _response = await dioHttpClientService.get("$blogUrl/$id");
      if (_response.statusCode != 200) {
        throw _response.data ?? "Something went wrong";
      }

      return Blog.fromJson(json.decode(json.encode(_response.data)));
    } on DioError catch (e) {
      throw getError(e);
    } catch (e) {
      throw e.toString() ?? "Something went wrong";
    }
  }

  String getError(e) {
    String _error = "Something went wrong";
    if (DioErrorType.receiveTimeout == e.type ||
        DioErrorType.connectTimeout == e.type) {
      _error =
          "Server is not reachable. Please verify your internet connection and try again";
    } else if (DioErrorType.response == e.type) {
    } else if (DioErrorType.other == e.type) {
      if (e.message.contains('SocketException')) {
        _error = 'Please verify your internet connection and try again"';
      }
    } else {
      _error = "Problem connecting to the server. Please try again.";
    }
    return _error;
  }
}
