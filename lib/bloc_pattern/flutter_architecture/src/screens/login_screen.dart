import 'package:flutter/material.dart';

import '../blocs/bloc.dart';
import '../blocs/bloc_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final singleInstanceBloc = BlocProvider.of(context);

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          emailField(singleInstanceBloc),
          Container(
            margin: EdgeInsets.only(top: 10),
          ),
          passwordField(singleInstanceBloc),
          Container(
            margin: EdgeInsets.only(top: 10),
          ),
          submitButton(singleInstanceBloc)
        ],
      ),
    );
  }

  Widget emailField(Bloc singleInstanceBloc) {
    return StreamBuilder(
        stream: singleInstanceBloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: singleInstanceBloc.changedEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'example@email.com',
                labelText: 'Email Address',
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField(Bloc singleInstanceBloc) {
    return StreamBuilder(
        stream: singleInstanceBloc.password,
        builder: (context, snapshot) {
          return TextField(
            //keyboardType: TextInputType.visiblePassword,
            onChanged: singleInstanceBloc.changePasswrod,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snapshot.error),
          );
        });
  }

  Widget submitButton(Bloc singleInstanceBloc) {
    return StreamBuilder(
        stream: singleInstanceBloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
            onPressed:
                snapshot.hasData == true ? singleInstanceBloc.submit : null,
            child: Text('Login'),
            color: Colors.blue,
          );
        });
  }
}
