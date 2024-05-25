import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nexatest/data/model/dokter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider extends ChangeNotifier {
  static const String _baseUrl = 'https://nexacaresys.codeplay.id/api';
  static const String _login = '/login';
  static const String _doctor = '/doctor';
  static const String _nearby = '/Nearby';

  static late String _listtoken;

  bool isloading = true;
  bool islogin = false;
  List<Dokter> list_dokter = [];
  late String user;
  late Map signinn;
  late Dokter dokter;
  late String account;

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    _listtoken = prefs.getString('token')!;
    user = prefs.getString('user')!;
    islogin = true;
    notifyListeners();
      notifyListeners();
  }

  signIn() async {
    signinn['username'];
    var body = json.encode(signinn);
    try {
      final response = await http.post(
          Uri.parse(DataProvider._baseUrl + DataProvider._login),
          headers: {"Content-Type": "application/json"},
          body: body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final parsed = data["response"]["token"];
        _listtoken = parsed.toString();
        islogin = true;
        notifyListeners();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _listtoken);
        await prefs.setString('user', user);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      const errorMessage = 'fail';
      return errorMessage;
    }
  }

  signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('user');
    islogin = false;
    notifyListeners();
  }

  getListDoctor() async {
    isloading = true;
    try {
      final response = await http.post(
        Uri.parse(DataProvider._baseUrl + DataProvider._doctor),
        headers: {"token": DataProvider._listtoken},
        body: jsonEncode(null),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final parsed = data["response"]["data"] as List<dynamic>;
        list_dokter = parsed.map((json) => Dokter.fromJson(json)).toList();
        isloading = false;
        notifyListeners();
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      const errorMessage = 'fail';
      return errorMessage;
    }
  }

  getNearbyDoctor() async {
    try {
      final response = await http.post(
        Uri.parse(DataProvider._baseUrl + DataProvider._nearby),
        headers: {"token": DataProvider._listtoken},
        body: jsonEncode(null),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final parsed = data["response"]["dataResponse"];
        dokter = Dokter.fromJson(parsed);
        isloading = false;
        notifyListeners();
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      const errorMessage = 'fail';
      return errorMessage;
    }
  }
}
