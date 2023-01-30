import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          //İlk eklenen child kendine en altta yer eder.
          children: [
            Container(
              color: Colors.red,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                color: Colors.blue,
                height: 100,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                height: 100,
                width: 25,
                child: Container(
                  color: Colors.green,
                )),
            Positioned.fill(
                top: 100,
                child: Container(
                  color: Colors.orange,
                )),
          ],
        ));
  }
}

/**
 * Stack kullanımı
 * Componentların bir diğer componente göre arkada veya üstte
 * kalmasını sağlar. 
 * Çalışma presibi : LIFO: Last In First Out 
 * yani son eklenen component en yukarda görünür.
 */