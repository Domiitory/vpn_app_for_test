import 'dart:developer';

import 'package:check_vpn_connection/check_vpn_connection.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:flutter_vpn/flutter_vpn_platform_interface.dart';
import 'package:flutter_vpn/state.dart';

class ServiceVPN {
  checkStateStatus() {
    FlutterVpnState.values;
    var currentState = FlutterVpnState.values;
    log("$currentState");
  }

  Future<void> updVpnState() async {}

  Future checkVpnConnection() async {
    CheckVpnConnection();
    if (CheckVpnConnection.isVpnActive() == true) {
      log("succes connection to VPN");
    } else {
      log("have error : no connection to VPN");
    }
  }

  void changeServer() {}
}
