import 'package:first_project/product/counter_hello_button.dart';
import 'package:flutter/material.dart';

class Stateful extends StatefulWidget {
  const Stateful({Key? key}) : super(key: key);

  @override
  State<Stateful> createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {
  int _countValue = 0;

  void _updateCounter(bool isIncrement) => setState(() => {isIncrement ? _countValue++ : _countValue--});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text('$_countValue', style: Theme.of(context).textTheme.headline2)),
          const Placeholder(),
          const CounterHelloButton()
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _incrementButton(),
          ),
          _decrementButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    print('Hello from increment');
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  FloatingActionButton _decrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(false);
      },
      child: const Icon(Icons.remove),
    );
  }
}
