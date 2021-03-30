import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// app depdendecies
import 'widgets/home.dart';
import 'providers/preference_provider.dart';
import 'models/color_model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PreferenceProvider>(
        create: (BuildContext context) => PreferenceProvider(),
        child: Consumer<PreferenceProvider>(
          builder: (context, provider, child) {
            return StreamBuilder(
                stream: provider.bloc.brightness,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return StreamBuilder<ColorModel>(
                      stream: provider.bloc.primaryColor,
                      builder: (context, snap) {
                        if (!snap.hasData) return Container();
                        return MaterialApp(
                          title: "Flutter Bol with Shared Preferences",
                          theme: ThemeData(
                              primaryColor: snap.data.color,
                              brightness: snapshot.data),
                          home: Scaffold(
                            body: Home(),
                          ),
                        );
                      });
                });
          },
        ));
  }
}

/// reference video
/// Flutter BLoC with Provider & Shared Preferences
/// https://www.youtube.com/watch?v=ZpLQIFUqaGI
