import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'validators.dart';

/// in blocs make the stream controllers pivate
/// make the add function public using geter functions
/// make the stream public using getter functions

class Bloc extends Object with Validators {
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  ///Add data to stream / change data in the strem
  Function(String) get changedEmail => _emailController.sink.add;
  Function(String) get changePasswrod => _passwordController.sink.add;

  /// add dTA TP stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (a, b) => true);

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print("Email is $validEmail");
    print("Password is $validPassword");
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

/// there are two ways to use bloc instances
/// 1) Single Global Instance  only recomended for small apps
/// 2) Scoped Instances for high complexity applications
///
///
/// Single Global Instance means that a single instance of the bloc class will be made and that will be accessed through out the application
///
/// Scoped Instances various instancec of the bloc class will be made and used accordingly
/// implmented using inherited widgets mostly
///
///

final Bloc singleGlobalInstanceBloc = Bloc();
