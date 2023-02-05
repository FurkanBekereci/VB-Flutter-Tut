import 'package:flutter/material.dart';

typedef IntCallback = void Function(int);

class LifeCycle extends StatefulWidget {
  const LifeCycle({Key? key, required this.message, required this.callback}) : super(key: key);
  final String message;
  final IntCallback callback;
  @override
  State<LifeCycle> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {
  String _message = '';
  int i = 0;
  late final bool _isOdd;
  //First call , like constructor
  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _setCorrectName();
    // print('a');
  }

  //Second call
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print('b');
  }

  //Parent interference
  @override
  void didUpdateWidget(covariant LifeCycle oldWidget) {
    widget.callback(++i);
    super.didUpdateWidget(oldWidget);
    // print('c');
  }

  //On component died
  @override
  void dispose() {
    super.dispose();
  }

  void _setCorrectName() {
    _isOdd ? _message += ' Tek' : _message += ' Çift';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}

/**
 * Notlar:
 * initState: Ctor gibi düşün, component veya page 
 * çizilmeden önce ilk çalışan block burasıdır.
 * didChangeDependency : initState'ten sonra drawing 
 * işleminden önce çalışır.
 * dispose : Component ekrandan kalktığında bu blok
 * çalışır.
 * didUpdateWidget : parent state değişikliklerinden
 * child widgetların etkilenmesi olayı burada çalışır.
 * Üst componentten sağlanan state değişkeni karşılaştırılarak 
 * alt widgetın rerender edilmesi durumu engellenebilir. 
 */
