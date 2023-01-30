import 'package:flutter/material.dart';

import 'color_demo.dart';

class LifeCycleDemo extends StatefulWidget {
  const LifeCycleDemo({Key? key}) : super(key: key);

  @override
  State<LifeCycleDemo> createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo> {
  late ColorDemo _colorDemo;
  @override
  void initState() {
    _colorDemo = ColorDemo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _emitEventToChildren, icon: const Icon(Icons.clear))],
      ),
      body: Column(
        children: [const Spacer(), Expanded(child: _colorDemo)],
      ),
    );
  }

  void _emitEventToChildren() {
    _colorDemo.streamController.add(null);
  }
}
