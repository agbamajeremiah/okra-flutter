import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'models/okra_handler.dart';
import 'dart:io' show Platform;
import 'view/web.dart';

class Okra {
  static Future<OkraHandler?> create(
      BuildContext context, Map<String, dynamic> okraOptions) async {
    AndroidDeviceInfo? androidDeviceInfo;
    IosDeviceInfo? iosDeviceInfo;

    okraOptions["uuid"] = Platform.isAndroid
        ? androidDeviceInfo!.androidId
        : iosDeviceInfo!.identifierForVendor;
    String? deviceName =
        Platform.isAndroid ? androidDeviceInfo!.brand : iosDeviceInfo!.name;
    String? deviceModel =
        Platform.isAndroid ? androidDeviceInfo!.model : iosDeviceInfo!.model;
    okraOptions["deviceInfo"] = {
      "deviceName": deviceName ?? '',
      "deviceModel": deviceModel ?? '',
      "longitude": 0,
      "latitude": 0,
      "platform": Platform.isAndroid ? "android" : "ios"
    };

    okraOptions["source"] = "flutter";
    okraOptions["isWebview"] = true;

    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Web(okraOptions: okraOptions),
      ),
    );
  }
}
