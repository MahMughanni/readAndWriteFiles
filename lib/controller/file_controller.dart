import 'dart:typed_data';

import 'package:files_test/file_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class FileController extends ChangeNotifier {
  String _text = '';
  Uint8List? _imageBytesList;

  String get text => _text;

  Uint8List? get imageBytesList => _imageBytesList;

  readTextFile() async {
    _text = await FileManager().readTextFile();
    notifyListeners();
  }

  writeTextFile() async {
    _text = await FileManager().writeTextFile();
    notifyListeners();
  }

  readImage() async {
    _imageBytesList = await FileManager().readImageFile();
    notifyListeners();
  }

  writeImage() async {
    _imageBytesList = await FileManager().writeImageFile();
    notifyListeners();
  }

  deleteImage() async {
    FileManager().deleteImage();
    _imageBytesList = null;
    notifyListeners();
  }
}
