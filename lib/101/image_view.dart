import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
              width: 200,
              height: 200,
              child: PngImageView(name: ImageItems().appleWithBookName)),
          const SizedBox(
              width: 200,
              height: 200,
              child: MyCustomImage())
        ],
      ),
    );
  }
}

class ImageItems {
  final String appleWithBook = "assets/images/apple-and-book.png";
  final String appleWithBookPng = "assets/images/ic_apple_with_book.png";
  final String appleWithBookName = "ic_apple_with_book";
}

class PngImageView extends StatelessWidget {
  const PngImageView({Key? key, required this.name, this.height}) : super(key: key);

  final String name;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      height: height,
    );
  }

  String get _nameWithPath => 'assets/images/$name.png';
}


/*
 * Özellikle bu component network veya file üzerinden eklenen bir imageview için
 * Placeholder tarzında default resim barındıran bir component haline geldi.
*/ 
class MyCustomImage extends StatelessWidget {
  const MyCustomImage({Key? key}) : super(key: key);

  final String src =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu0H--POTsphd2IR-Zc53rePxfA_Kj5WAKHw&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      errorBuilder: (context, error, stackTrace) => PngImageView(name: ImageItems().appleWithBookName)
    );
  }
}




/**
 * Image.memory => Byte Array
 * Image.file, Image.assets => File'dan veya pathten okuma
 * Image.network => Network based image 
 */
