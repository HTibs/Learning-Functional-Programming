import 'package:flutter/material.dart';

// app dependencies
import '../blocs/preference_bloc.dart';

class PreferenceProvider extends ChangeNotifier {
  PreferenceBloc _bloc;

  PreferenceProvider() {
    _bloc = PreferenceBloc();
    _bloc.loadPreferences();
  }

  PreferenceBloc get bloc => _bloc;
}
