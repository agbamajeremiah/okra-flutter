import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:okra_widget/utils/device_info.dart';
import 'models/okra_handler.dart';
import 'dart:io' show Platform;
import 'view/web.dart';

class Okra {
  static Future<OkraHandler?> create(
      BuildContext context, Map<String, dynamic> okraOptions) async {
    var deviceInfo = Platform.isAndroid
        ? await DeviceInfo.getAndroidInfo()
        : await DeviceInfo.getIosInfo();
    okraOptions["uuid"] = Platform.isAndroid
        ? (deviceInfo as AndroidDeviceInfo?)?.androidId ?? ''
        : (deviceInfo as IosDeviceInfo?)?.identifierForVendor ?? '';
    String? deviceName = Platform.isAndroid
        ? (deviceInfo as AndroidDeviceInfo?)?.brand
        : (deviceInfo as IosDeviceInfo?)?.name;
    String? deviceModel = Platform.isAndroid
        ? (deviceInfo as AndroidDeviceInfo?)?.model
        : (deviceInfo as IosDeviceInfo?)?.model;
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
