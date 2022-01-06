import 'package:flutter/foundation.dart';

class Device extends ChangeNotifier {
  final String deviceId;
  final String deviceName;
  final bool isDevicePlayingSong;

  Device({
    required this.deviceId,
    required this.deviceName,
    required this.isDevicePlayingSong,
  });

  Future<void> addNewDevice(String deviceId, String deviceName) async {

  }

  Future<void> changeDevicePlayingStatus(bool isDevicePlayingSong) async {

  }
}
