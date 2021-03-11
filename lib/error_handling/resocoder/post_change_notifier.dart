import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';

import 'post_service.dart';

enum NotifierState { initial, loading, loaded }

class PostChangeNotifier extends ChangeNotifier {
  final _postService = PostService();

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Either<Failure, Post> _post;
  Either<Failure, Post> get post => _post;
  void _setPost(Either<Failure, Post> post) {
    _post = post;
    notifyListeners();
  }

  void getOnePost() async {
    _setState(NotifierState.loading);

    /// the comment out part was related to change notifier way of implementing error handling
    // try {
    //   final post = await _postService.getOnePost();
    //   _setPost(post);
    // } on Failure catch (f) {
    //   _setPost(f);
    //   _setFailure(f);
    // }
    /// the following part implements the either and functional programming way of error handling

    await Task(() => _postService.getOnePost())
        .attempt()
        .map((either) => either.leftMap((l) {
              try {
                l as Failure;
              } catch (e) {
                throw l;
              }
            }))
        .run()
        .then((value) => _setPost(value));

    _setState(NotifierState.loaded);
  }
}
