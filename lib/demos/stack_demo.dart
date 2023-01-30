import 'package:first_project/core/random_image.dart';
import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);
  final double _cardHeight = 50;
  final double _cardWidth = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //1 Image
                  Positioned.fill(bottom: _cardHeight / 2, child: const RandomImage()),
                  //2 Card
                  Positioned(height: _cardHeight, bottom: 0, width: _cardWidth, child: _customCard())
                ],
              )),
          const Spacer(flex: 6)
        ],
      ),
    );
  }

  Card _customCard() {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}

// Not : Eğer iç içe çok fazla dallanma varsa
// function component haline getirmen 
// kodun okunurluğunu artırır.