import 'package:first_project/demos/life_cycle_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
        theme: ThemeData.dark().copyWith(
            progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
            errorColor: Colors.red,
            textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.amber)),
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.transparent,
                elevation: 0)),
        home: const LifeCycleDemo());
    // LifeCycle(
    //     message: '41qsdad',
    //     callback: (value) {
    //       print("Mainden selamlar, $value");
    //     }));
  }
}
