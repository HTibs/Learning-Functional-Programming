import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// added dependencies
import 'package:provider/provider.dart';

// app depdendencies
import '../providers/preference_provider.dart';
import '../blocs/preference_bloc.dart';
import '../models/color_model.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PreferenceBloc bloc = Provider.of<PreferenceProvider>(context).bloc;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: GestureDetector(
            onTap: () {
              //TODO: Save settings
              bloc.savePreferences();
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dark Mode'),
                  StreamBuilder<Brightness>(
                    stream: bloc.brightness,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Switch(
                        value:
                            (snapshot.data == Brightness.light) ? false : true,
                        onChanged: (bool value) {
                          if (value)
                            bloc.changeBrightness(Brightness.dark);
                          else
                            bloc.changeBrightness(Brightness.light);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Primary Color'),
                  StreamBuilder<ColorModel>(
                      stream: bloc.primaryColor,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Container();
                        return Slider(
                          value: snapshot.data.index,
                          onChanged: (double value) {
                            bloc.changePrimaryColor(
                                bloc.indexToPrimaryColor(value));
                          },
                          min: 0.0,
                          max: 3.0,
                          divisions: 3,
                          label: snapshot.data.name,
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
