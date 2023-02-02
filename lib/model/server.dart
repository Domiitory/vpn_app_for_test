import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ServerList {
  List<Server> servers;
  ServerList({required this.servers});
  factory ServerList.fromJson(Map<String, dynamic> json) {
    var serversJson = json['servers'];
    List<Server> serversList =
        serversJson.map((i) => Server.fromJson(i)).toList();

    return ServerList(servers: serversList);
  }
}

class Server {
  final String country;
  final String flag;
  final String ip;
  final String urlServer;
  final String username;
  final String password;
  final bool passPremium;

  Server({
    required this.country,
    required this.flag,
    required this.ip,
    required this.urlServer,
    required this.username,
    required this.password,
    required this.passPremium,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
        country: json['country'],
        flag: json['flag'],
        ip: json['ip'],
        urlServer: json['urlServer'],
        username: json['username'],
        password: json['password'],
        passPremium: json['passPremium']);
  }
}

// Future<ServerList> getServer() async {
//   const url = 'http://google.com';
//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     return ServerList.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception("Error:${response.reasonPhrase}");
//   }
// }

Future<List<Server>> getServer() async {
  final response = await rootBundle.loadString('assets/serverData.json');
  List data = json.decode(response) as List<dynamic>;
  if (response.isNotEmpty) {
    return data.map((e) => Server.fromJson(e)).toList();
  } else {
    throw Exception();
  }
}
