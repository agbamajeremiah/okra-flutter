import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static Future<AndroidDeviceInfo?> getAndroidInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        return await deviceInfoPlugin.androidInfo;
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static Future<IosDeviceInfo?> getIosInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isIOS) {
        return await deviceInfoPlugin.iosInfo;
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }
}
