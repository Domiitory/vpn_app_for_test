import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_app_for_test/model/server.dart';

class LocalStorage {
  Future<String> getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('ServerList') ?? '';
  }

  Future<void> setHistory(List<Server> serverList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ServerList', jsonEncode(serverList));
  }

  Future<void> removeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('ServerList');
  }
}
