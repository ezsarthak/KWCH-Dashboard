import 'package:flutter/material.dart';

import 'shared_preferences.dart';

class MyAppProvider with ChangeNotifier {
  UserSimplePrefs novelPreference = UserSimplePrefs();

  bool _darkTheme = true;
  bool _bg = false;
  int _axis = 4;
  int _mainaxis = 4;

  bool get darkTheme => _darkTheme;
  bool get bg => _bg;
  int get axis => _axis;
  int get mainaxis => _mainaxis;

  set darkTheme(bool value) {
    _darkTheme = value;
    novelPreference.setDarkTheme(value);
    notifyListeners();
  }

  set axisCount(int value) {
    _axis = value;
    novelPreference.setaxis(value);
    notifyListeners();
  }

  set mainaxisCount(int value) {
    _mainaxis = value;
    novelPreference.setmainaxis(value);
    notifyListeners();
  }

  set widgetbg(bool value) {
    _bg = value;
    novelPreference.setbg(value);
    notifyListeners();
  }
  //
  // final googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? _user;
  // GoogleSignInAccount get user => _user!;
  //
  // Future googleLogin() async {
  //   final googleUser = await googleSignIn.signIn();
  //   if (googleUser == null) return;
  //   _user = googleUser;
  //
  //   final googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   notifyListeners();
  // }
  //
  // Future logOut() async {
  //   await googleSignIn.disconnect();
  //   FirebaseAuth.instance.signOut();
  //   notifyListeners();
  // }
}
