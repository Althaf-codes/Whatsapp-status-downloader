import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_clone/constants/constants.dart';

class StatusProvider extends ChangeNotifier {
  List<FileSystemEntity> _allimages = [];
  List<FileSystemEntity> _allvideos = [];
  bool _iswhatsappavailabale = false;
  List<FileSystemEntity> get getimages => _allimages;

  List<FileSystemEntity> get getvideos => _allvideos;
  bool get iswhatsappavailabale => _iswhatsappavailabale;

  void getStatus(String ext) async {
    final status = await Permission.storage.request();
    //Directory? directory = await getExternalStorageDirectory();

    if (status.isDenied) {
      Permission.storage.request();
      log("Permission denied");
    }

    if (status.isGranted) {
      print("Permission Granted");
      final directory = Directory(whatsappPath);

      if (directory.existsSync()) {
        final items = directory.listSync();
        print(items.toString());

        if (ext == ".mp4") {
          _allvideos =
              items.where((element) => element.path.endsWith(".mp4")).toList();
          notifyListeners();
        } else if (ext == ".jpg") {
          _allimages =
              items.where((element) => element.path.endsWith(".jpg")).toList();
          notifyListeners();
        }

        _iswhatsappavailabale = true;
        notifyListeners();
      } else {
        print("no whatsapp ");
        _iswhatsappavailabale = false;
        notifyListeners();
      }
    }
  }
}
