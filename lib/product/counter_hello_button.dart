import 'package:first_project/product/language/language_items.dart';
import 'package:flutter/material.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({Key? key}) : super(key: key);

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _secondCountValue = 0;
  final String _welcomeText = LanguageItems.welcomeText;

  void _updateCounter() {
    setState(() {
      _secondCountValue++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _updateCounter,
      child: Text('$_welcomeText $_secondCountValue'),
    );
  }
}
