import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_project/202/service/post_model.dart';
import 'package:flutter/foundation.dart';

import 'comment_model.dart';

abstract class IPostService {
  Future<PostModel?> sendPostItem(PostModel post);
  Future<PostModel?> updatePostItem(PostModel post, int id);
  Future<List<PostModel>?> fetchPostItems();
  Future<bool> deletePostItem(int id);
  Future<List<CommentModel>?> fetchCommentItemsOfPost(int postId);
}

class PostService implements IPostService {
  late final String _baseUrl;
  late final Dio _dio;

  PostService() {
    _baseUrl = 'https://jsonplaceholder.typicode.com/';
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  @override
  Future<PostModel?> sendPostItem(PostModel post) async {
    try {
      final result = await _dio.post('posts', data: post);

      if (result.statusCode == HttpStatus.created) {
        // final datas = result.data;
        return PostModel.fromJson(result.data);
      }

      return null;
    } catch (_) {
      if (kDebugMode) {
        print('error');
      }
      return null;
    }
  }

  @override
  Future<PostModel?> updatePostItem(PostModel post, int id) async {
    try {
      final result = await _dio.put('posts/${id.toString()}', data: post);

      if (result.statusCode == HttpStatus.ok) {
        // final datas = result.data;
        return PostModel.fromJson(result.data);
      }

      return null;
    } catch (_) {
      if (kDebugMode) {
        print('error');
      }
      return null;
    }
  }

  @override
  Future<bool> deletePostItem(int id) async {
    try {
      final result = await _dio.delete('posts/${id.toString()}');

      return result.statusCode == HttpStatus.ok;
    } catch (_) {
      if (kDebugMode) {
        print('error');
      }
      return false;
    }
  }

  @override
  Future<List<PostModel>?> fetchPostItems() async {
    try {
      final result = await _dio.get('posts');

      if (result.statusCode == HttpStatus.ok) {
        final data = result.data;

        if (data is List) {
          return data.map((e) => PostModel.fromJson(e)).toList();
        } else {
          return [PostModel.fromJson(data)];
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<CommentModel>?> fetchCommentItemsOfPost(int postId) async {
    try {
      final result = await _dio.get('comments', queryParameters: {'postId': postId});

      if (result.statusCode == HttpStatus.ok) {
        final data = result.data;

        if (data is List) {
          return data.map((e) => CommentModel.fromJson(e)).toList();
        } else {
          return [CommentModel.fromJson(data)];
        }
      }
      return null;
    } on DioError catch (e) {
      _ErrorPrinter.printError(e, this);
      return null;
    }
  }
}

class _ErrorPrinter {
  static void printError<T>(DioError error, T? type) {
    if (kDebugMode) {
      print(error.message);
    }
    if (type != null) {
      if (kDebugMode) {
        print(type);
      }
    }
    if (kDebugMode) {
      print('-----------------');
    }
  }
}
