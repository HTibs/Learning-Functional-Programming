import 'package:flutter/material.dart';
import 'package:new_concepts/connectivity/filled_stacks/enums/connectivity_status.dart';
import 'package:new_concepts/connectivity/filled_stacks/services/connectivity_service.dart';
import 'package:provider/provider.dart';
import 'home_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      create: (context) => ConnectivityService().connectionController.stream,
      builder: (context, _) => MaterialApp(
        title: "Connectivity Awar Ui",
        home: Scaffold(
          body: HomeView(),
        ),
      ),
    );
  }
}
