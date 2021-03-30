import 'package:flutter/material.dart';
import 'package:new_concepts/connectivity/filled_stacks/network_sensitive.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NetworkSensitive(
        child: Center(
          child: Text("Heelo there"),
        ),
      ),
    ));
  }
}
