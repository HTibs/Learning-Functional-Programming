import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

import 'blocs/bloc_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: "Log me IN",
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
