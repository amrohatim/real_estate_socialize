import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mydeviceutil {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }
}

class LaunchUrlString {
  LaunchUrlString(String url);

  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
    } else {}
  }

  static canLaunchUrlString(String url) async {
    LaunchUrlString(url);
  }
}
