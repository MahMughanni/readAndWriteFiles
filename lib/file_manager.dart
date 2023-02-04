import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  static FileManager? _fileManager;

  FileManager._internal() {
    _fileManager = this;
  }

  factory FileManager() => _fileManager ?? FileManager._internal();

  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _file async {
    final path = await _directoryPath;
    return File('$path/test.txt');
  }

  Future<File> get imageFile async {
    final path = await _directoryPath;
    return File('$path/test_image.png');
  }

  Future<String> readTextFile() async {
    String fileContent = 'test file';
    File file = await _file;
    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e.toString());
      }
    }
    return fileContent;
  }

  Future<String> writeTextFile() async {
    String text = DateFormat('h:mm:ss').format(DateTime.now());
    File file = await _file;
    await file.writeAsString(text);
    return text;
  }

  writeImageFile() async {
    var imageUrl =
        'https://media.wired.com/photos/62d75d34ddaaa99a1df8e61d/master/pass/Phone-Camera-Webcam-Gear-GettyImages-1241495650.png';
    Response response = await Client().get(Uri.parse(imageUrl));
    Uint8List bytes = response.bodyBytes;
    File file = await imageFile;
    await file.writeAsBytes(bytes);
    return bytes;
  }

  Future<Uint8List> readImageFile() async {
    File file = await imageFile;
    Uint8List byteList = await file.readAsBytes();
    if (file.existsSync()) {
      try {
        return byteList;
      } catch (e) {
        print(e);
      }
    }
    return byteList;
  }

  deleteImage() async {
    File file = await imageFile;
    if (file.existsSync()) {
      await file.delete();
    }
  }
}
//
// void printWrapped(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//   pattern.allMatches(text).forEach((match) => print(match.group(0)));
// }
