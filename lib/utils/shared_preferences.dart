// ignore_for_file: unused_field

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePrefs {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static const themeStatus = "themeStatus";
  static const bgStatus = "backGroundStatus";
  static const axisStatus = "axisStatus";
  static const mainaxisStatus = "mainaxisStatus";

  setbg(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(bgStatus, value);
  }

  Future<bool> getbg() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(bgStatus) ?? false;
  }

  setaxis(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(axisStatus, value);
  }

  Future<int> getaxis() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(axisStatus) ?? 4;
  }

  setmainaxis(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(mainaxisStatus, value);
  }

  Future<int> maingetaxis() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(mainaxisStatus) ?? 4;
  }

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? true;
  }
}
