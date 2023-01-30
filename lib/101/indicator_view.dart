import 'package:flutter/material.dart';

class IndicatorView extends StatelessWidget {
  const IndicatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CircularLoading()],
      ),
      body: const LinearProgressIndicator(),
    );
  }
}

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.red,
      strokeWidth: 10,
      value: 0.6,
      backgroundColor: Colors.white,
    ));
  }
}
