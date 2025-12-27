import 'package:fill_store_bb/app/screen/profile/widgets/settings_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsDevicePermission extends StatelessWidget {
  const SettingsDevicePermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppbar(title: "Cihaz izinleri"),
      body: Wrap(
        children: [
          PermissionControl(
            type: "Kamera",
            value: false,
            onChanged: (value) async {
              PermissionStatus status = await Permission.camera.request();

              if (status == PermissionStatus.denied) {
                await Permission.camera.request();
              } else if (status == PermissionStatus.permanentlyDenied) {
                openAppSettings();
              }
            },
          ),
          PermissionControl(
            type: "Rehber eşleme",
            value: false,
            onChanged: (value) async {
              PermissionStatus status = await Permission.contacts.request();

              if (status == PermissionStatus.denied) {
                await Permission.contacts.request();
              } else if (status == PermissionStatus.permanentlyDenied) {
                openAppSettings();
              }
            },
          ),
          PermissionControl(
            type: "Konum servisleri",
            value: false,
            onChanged: (value) async {
              PermissionStatus status = await Permission.location.request();

              if (status == PermissionStatus.denied) {
                await Permission.location.request();
              } else if (status == PermissionStatus.permanentlyDenied) {
                openAppSettings();
              }
            },
          ),
          PermissionControl(
            type: "Galeri",
            value: false,
            onChanged: (value) async {
              PermissionStatus status = await Permission.mediaLibrary.request();

              if (status == PermissionStatus.denied) {
                await Permission.mediaLibrary.request();
              } else if (status == PermissionStatus.permanentlyDenied) {
                openAppSettings();
              }
            },
          ),
          PermissionControl(
            type: "Mikrofon",
            value: false,
            onChanged: (value) async {
              PermissionStatus status = await Permission.microphone.request();

              if (status == PermissionStatus.denied) {
                await Permission.microphone.request();
              } else if (status == PermissionStatus.permanentlyDenied) {
                openAppSettings();
              }
            },
          )
        ],
      ),
    );
  }
}

class PermissionControl extends StatelessWidget {
  final String type;
  final bool value;
  final Function(bool) onChanged;

  const PermissionControl({
    super.key,
    required this.type,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(type, style: TextStyle(fontSize: 16)),
          const Spacer(),
          CupertinoSwitch(
            value: value,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}
