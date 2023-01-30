import 'package:flutter/material.dart';

class PaddingView extends StatelessWidget {
  const PaddingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPaddings.pagePaddingVertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(color: Colors.white, height: 100),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(color: Colors.white, height: 100),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20) +
                const EdgeInsets.symmetric(vertical: 10),
            child: Container(color: Colors.red, height: 100),
          )
        ]),
      ),
    );
  }
}

//Padding best practise
class ProjectPaddings {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
}