import 'package:first_project/202/sheet_learn_view.dart';
import 'package:first_project/202/theme/light_theme.dart';
import 'package:flutter/material.dart';
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
        home: const SheetLearnView());
    // LifeCycle(
    //     message: '41qsdad',
    //     callback: (value) {
    //       print("Mainden selamlar, $value");
    //     }));
  }
}

extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNullOrWhitespace => this == null || (this!.isNotEmpty && this!.trim().isEmpty);
}
