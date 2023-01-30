import 'package:flutter/material.dart';

//Class içinde değişken data tutmaz
//Değişen data parenttan veya dış kanynaktan (örneğin theme, context) gelir.
class Stateless extends StatelessWidget {
  final String text2 = "Hello";

  const Stateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // implemented build
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _TitleWidget(
              text: text2,
            ),
            const _TitleWidget(
              text: "1",
            ),
            _emptyBox(),
            const _TitleWidget(
              text: "2",
            ),
            _emptyBox(),
            const _TitleWidget(
              text: "3",
            )
          ],
        ));
  }

  SizedBox _emptyBox() => const SizedBox(height: 10);
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline3);
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, this.test}) : super(key: key);

  //Stateelss widget içinde olması gereken fieldlar bu şekilde işaretlenir.
  final String? test;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
