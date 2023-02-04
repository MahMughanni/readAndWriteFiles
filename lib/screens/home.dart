import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/file_controller.dart';
import '../widget/cheetah_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(
          //   context.select(
          //     (FileController controller) => controller.user != null
          //         ? controller.user.name
          //         : 'CheetahCoding',
          //   ),
          // ),
          ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.select(
                (FileController controller) => controller.imageBytesList != null
                    ? Image.memory(controller.imageBytesList!)
                    : Image.asset('assets/images/logo.png', height: 160),
              ),
              // Image.asset('assets/images/logo.png', height: 160),
              const SizedBox(height: 24),
              Text(
                context.select((FileController controller) => controller.text),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 16),
              CheetahButton(
                text: "Save to .txt",
                onPressed: () => context.read<FileController>().writeTextFile(),
              ),
              // const SizedBox(height: 16),
              // CheetahButton(text: "Save to .json", onPressed: () {}),
              const SizedBox(height: 16),
              CheetahButton(
                text: "Save Image File",
                onPressed: () => context.read<FileController>().writeImage(),
              ),
              const SizedBox(height: 16),
              CheetahButton(
                text: "Delete Image File",
                onPressed: () => context.read<FileController>().deleteImage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
