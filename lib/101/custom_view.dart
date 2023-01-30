import 'package:flutter/material.dart';

class CustomView extends StatelessWidget {
  const CustomView({Key? key}) : super(key: key);
  final String text = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigCustomFoodButton(
              text: text,
              onPressed: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            CustomFoodButton(
              text: text,
              onPressed: () => {},
            )
          ],
        ));
  }
}

// typedef ButtonOnPressAction = void Function();

class BigCustomFoodButton extends CustomFoodButton {
  BigCustomFoodButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) : super(key: key, text: text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padHor,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: super.build(context),
        ),
      ),
    );
  }
}

class _ColorsUtility {
  final Color red = Colors.red;
  final Color white = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets padNormal = const EdgeInsets.all(8);
  final EdgeInsets pad2x = const EdgeInsets.all(16);
  final EdgeInsets padHor = const EdgeInsets.symmetric(horizontal: 10);
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: red, shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Padding(
          padding: padNormal,
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.subtitle2?.copyWith(color: white),
          ),
        ));
  }
}
