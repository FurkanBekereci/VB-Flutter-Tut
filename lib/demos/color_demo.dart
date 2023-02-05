// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorDemo extends StatefulWidget {
  ColorDemo({Key? key}) : super(key: key) {
    streamController = StreamController.broadcast();
  }
  // Color? externalColor;
  //late VoidCallback changeMyColorFromOutside;
  late StreamController streamController;

  @override
  State<ColorDemo> createState() => _ColorDemoState();
}

class _ColorDemoState extends State<ColorDemo> {
  Map<MyColorNames, Color> myList = {
    MyColorNames.Red: Colors.red,
    MyColorNames.Yellow: Colors.yellow,
    MyColorNames.Blue: Colors.blue
  };
  late Color _currentColor;
  late int _currentIndex;
  late StreamSubscription _$subscription;

  void setStateWhenOutsideAction() {
    _setCurrentValues();
  }

  void _setCurrentValues([int? value]) {
    setState(() {
      _currentColor = value != null ? myList.values.elementAt(value) : Colors.pink;
      _currentIndex = value ?? 0;
    });
  }

  void subscribeToOutsideSignal() {
    _$subscription = widget.streamController.stream.listen((event) {
      // print("üyeyim hacı...");
      setStateWhenOutsideAction();
    });
  }

  void cancelSubscriptionOfOutsideSignal() {
    _$subscription.cancel();
  }

  @override
  void initState() {
    _currentColor = myList.values.elementAt(0);
    _currentIndex = 0;
    subscribeToOutsideSignal();
    // widget.changeMyColorFromOutside = () {
    //   outsideAction();
    // };
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // print("disposa girdiysen 3 kere tıkla");
    cancelSubscriptionOfOutsideSignal();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ColorDemo oldWidget) {
    // setState(() {
    //   _currentColor = widget.externalColor ?? _currentColor;
    // });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: _currentColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _setCurrentValues,
          selectedItemColor: _currentColor,
          items: _getBottomNavBarItems()),
    );
  }

  List<BottomNavigationBarItem> _getBottomNavBarItems() {
    return myList.entries
        .map(
          (item) => BottomNavigationBarItem(icon: _colorContainer(item.value), label: item.key.name),
        )
        .toList();
  }

  Container _colorContainer(Color color) => Container(width: 10, height: 10, color: color);
}

enum MyColorNames {
  Red,
  Yellow,
  Blue,
} 

// class _ColorUtilities {
//   static Color get randomColor {
//     int randomR = Random().nextInt(255);
//     int randomG = Random().nextInt(255);
//     int randomB = Random().nextInt(255);
//     return Color.fromARGB(255, randomR, randomG, randomB);
//   }
// }
