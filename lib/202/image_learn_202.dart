import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.ic_apple_with_book.toWidget(height: 320),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  ic_apple_with_book
}

extension ImagePathExtension on ImagePaths {
  String get path => 'assets/images/$name.png';

  Widget toWidget({double height = 100}) => Image.asset(
        path,
        height: height,
      );
}
