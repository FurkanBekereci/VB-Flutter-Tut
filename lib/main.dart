import 'package:first_project/202/cache/secure_storage/secure_storage_learn.dart';
import 'package:first_project/202/theme/light_theme.dart';
import 'package:flutter/material.dart';
import '202/base_entity.dart';
import '202/reflection/reflection_helper.dart';
import 'main.reflectable.dart';

void main() {
  initializeReflectable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: LightTheme().theme,
        // ThemeData.dark().copyWith(
        //   tabBarTheme: const TabBarTheme(),
        //   progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
        //   errorColor: Colors.red,
        //   textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.amber)),
        //   appBarTheme: const AppBarTheme(
        //     centerTitle: true,
        //     systemOverlayStyle: SystemUiOverlayStyle.light,
        //     backgroundColor: Colors.transparent,
        //     elevation: 0,
        //   ),
        // ),
        home: const SecureStorageLearn());
    // LifeCycle(
    //     message: '41qsdad',
    //     callback: (value) {
    //       print("Mainden selamlar, $value");
    //     }));
  }
}

@reflector
class Product extends BaseEntity {
  String? name;
  String? desc;
  String? _hello;

  @override
  String toString() {
    return '$name-$desc';
  }
}

extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNullOrWhitespace => this == null || (this!.isNotEmpty && this!.trim().isEmpty);
}
