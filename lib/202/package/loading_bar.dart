import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Third party widgetların sayfalara doğrudan erişmesini engeller. Adapter Pattern kullan
class LoadingBar extends StatefulWidget {
  const LoadingBar({Key? key, this.size = 50}) : super(key: key);
  final double size;
  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      color: Colors.white,
      size: widget.size,
      controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
    );
  }
}
