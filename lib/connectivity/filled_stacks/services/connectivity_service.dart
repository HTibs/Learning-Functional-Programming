import 'dart:async';

import 'package:connectivity/connectivity.dart';
import '../enums/connectivity_status.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // convert this obtained result to enum
      var connectionStatus = _getStatusFromResult(result);
      connectionController.add(connectionStatus);
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.Wifi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
    }
  }

  void dispose() {
    connectionController.close();
  }
}
