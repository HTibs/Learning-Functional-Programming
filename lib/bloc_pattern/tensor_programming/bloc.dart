import 'dart:async';
import 'model.dart';

import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final API api = API();

  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();
  ReplaySubject<String> _query = ReplaySubject<String>();

  Stream<String> get log => _log;
  Stream<List<Movie>> get results => _results;
  Sink<String> get query => _query;
}
