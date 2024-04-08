import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static getNotificationsPermission() async {
    PermissionStatus status = await Permission.notification.status;
    debugPrint("BluetoothConnect STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.notification.request();
      debugPrint("BluetoothConnect STATUS AFTER ASK:$status");
    }
  }
}
