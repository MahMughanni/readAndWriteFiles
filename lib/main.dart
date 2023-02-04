import 'package:files_test/controller/file_controller.dart';
import 'package:files_test/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => FileController())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    context.read<FileController>().readTextFile();
    context.read<FileController>().readImage();
    context.read<FileController>().deleteImage();
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
