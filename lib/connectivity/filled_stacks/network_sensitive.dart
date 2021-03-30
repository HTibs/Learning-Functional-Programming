import 'package:flutter/material.dart';
import 'package:new_concepts/connectivity/filled_stacks/enums/connectivity_status.dart';
import 'package:new_concepts/connectivity/filled_stacks/services/connectivity_service.dart';

import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final String text;

  NetworkSensitive({this.child,this.text});

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.Wifi) return child;
    if (connectionStatus == ConnectivityStatus.Cellular) return child;
    return child;
  }
}
