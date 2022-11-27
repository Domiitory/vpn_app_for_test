import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vpn/state.dart';
import 'package:vpn_app_for_test/constants.dart';
import 'package:vpn_app_for_test/utils/util.dart';
import 'package:vpn_app_for_test/widgets/network_speed_widget.dart';
import 'package:flutter_vpn/flutter_vpn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isactive = false;
  var state = FlutterVpnState.disconnected;
  CharonErrorState? charonState = CharonErrorState.NO_ERROR;
  @override
  // initialize vpn
  void initState() {
    FlutterVpn.prepare();
    FlutterVpn.onStateChanged.listen((s) => setState(() => state = s));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Utils vpnUtils = Utils();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VPN",
          style: TextStyle(color: primaryColor, fontSize: 30),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: bgColor,
      ),
      backgroundColor: bgColor,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.2),
          // VPN start/stop button
          Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(150),
              onTap: () {
                setState(() {
                  _isactive = !_isactive;
                });
                if (_isactive == true) {
                  try {
                    FlutterVpn.connectIkev2EAP(
                      server: vpnUtils.nameServer,
                      username: vpnUtils.userName,
                      password: vpnUtils.password,
                    );
                  } catch (e) {
                    log("$e");
                  }
                } else if (_isactive == false) {
                  FlutterVpn.disconnect();
                }
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(150),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        _isactive == true ? Colors.greenAccent : primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.power_settings_new,
                          size: 30,
                          color: _isactive == true ? primaryColor : Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _isactive == true ? "STOP" : "START",
                          style: TextStyle(
                              color: _isactive == true
                                  ? Colors.black
                                  : Colors.grey,
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // Network speed value
          const Text(
            "Network speed",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NetworkSpeedWidget(
                  bgIcnColor: primaryColor.withOpacity(0.2),
                  icnColor: primaryColor,
                  icon: Icons.arrow_downward,
                  tText: "Download",
                  sText: _isactive == true ? "128.00" : "00.00",
                ),
                NetworkSpeedWidget(
                  bgIcnColor: primaryColor.withOpacity(0.2),
                  icnColor: primaryColor,
                  icon: Icons.arrow_downward,
                  tText: "Upload",
                  sText: _isactive == true ? "345.00" : "00.00",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
