// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:first_project/202/custom_exception.dart';

abstract class IFileDownload<T extends FileItem> {
  downloadItem(T? fileItem);
}

class FileDownload<T extends FileItem> with ShareMixin implements IFileDownload<T> {
  // Flutterda bütün metodlar null döner yazmasan. Ama good practice olarak return null yazılması gerektiği warningi verir.
  @override
  bool? downloadItem(T? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    // print('downloaded!!!');
    shareIt();
    return true;
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem({
    required this.name,
    required this.file,
  });
}

mixin ShareMixin<T extends IFileDownload> {
  void shareIt() {}
}
