import 'package:flutter/material.dart';

abstract class BaseViewModel<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void toggleOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
