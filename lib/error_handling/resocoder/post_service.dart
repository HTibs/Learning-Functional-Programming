import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class FakeHttpClient {
  Future<String> getResponseBody() async {
    await Future.delayed(Duration(milliseconds: 500));
    //! No Internet Connection
    //throw SocketException('No Internet');
    //! 404
    // throw HttpException('404');
    //! Invalid JSON (throws FormatException)
    // return 'abcd';
    /// expection like filesytem exception need not be shown to the user but it is better to directly crash the app in these cases
    /// this file system exception is also not caught diresctly below in the post service class
    throw FileSystemException();
    return '{"userId":1,"id":1,"title":"nice title","body":"cool body"}';
  }
}

class PostService {
  final httpClient = FakeHttpClient();
  Future<Post> getOnePost() async {
    // The WORST type of error handling.
    // There's no way to get these error messages to the UI.
    try {
      final responseBody = await httpClient.getResponseBody();
      return Post.fromJson(responseBody);
    } on SocketException {
      throw Failure("Socket Exception no internet connetion");
      rethrow;
      print("Socket Exception no internet connetion");
    } on HttpException {
      throw Failure("HttpException: Coundly fing the httpp response");
      //rethrow;
      print("HttpException: Coundly fing the httpp response");
    } on FormatException {
      throw Failure("FormatExceprtion: Bad format of Json received");
      //rethrow;
      print("FormatExceprtion: Bad format of Json received");
    }
  }
}

class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message;
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    @required this.id,
    @required this.userId,
    @required this.title,
    @required this.body,
  });

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
    );
  }

  static Post fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post id: $id, userId: $userId, title: $title, body: $body';
  }
}
