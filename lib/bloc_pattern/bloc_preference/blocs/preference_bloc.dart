import 'package:flutter/material.dart';
// added packages
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

//app depdendencies
import '../models/color_model.dart';

class PreferenceBloc {
  final BehaviorSubject<Brightness> _brightness = BehaviorSubject<Brightness>();
  final BehaviorSubject<ColorModel> _primaryColor =
      BehaviorSubject<ColorModel>();

  final List<ColorModel> _colors = [
    ColorModel(name: 'Blue', color: Colors.blue, index: 0.0),
    ColorModel(name: 'Green', color: Colors.green, index: 1.0),
    ColorModel(name: 'Red', color: Colors.red, index: 2.0),
    ColorModel(name: 'White', color: Colors.white, index: 3.0),
  ];

  Stream<Brightness> get brightness => _brightness.stream;
  Stream<ColorModel> get primaryColor => _primaryColor.stream;

  Function(Brightness) get changeBrightness => _brightness.sink.add;
  Function(ColorModel) get changePrimaryColor => _primaryColor.sink.add;

  ColorModel indexToPrimaryColor(double index) {
    return _colors.firstWhere((element) => element.index == index);
  }

  savePreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (_brightness.value == Brightness.light) {
      await pref.setBool('dark', false);
    } else
      await pref.setBool('dark', true);

    await pref.setDouble('colorIndex', _primaryColor.value.index);
  }

  loadPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool darkMode = pref.getBool('dark');
    double colorIndex = pref.getDouble('colorIndex');
    if (darkMode != null) {
      (darkMode == false)
          ? changeBrightness(Brightness.light)
          : changeBrightness(Brightness.dark);
    } else
      changeBrightness(Brightness.light);

    if (colorIndex != null) {
      changePrimaryColor(indexToPrimaryColor(colorIndex));
    } else
      changePrimaryColor(indexToPrimaryColor(0.0));
  }

  void dispose() {
    _brightness.close();
    _primaryColor.close();
  }
}
