import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView({Key? key}) : super(key: key);
  final String name = 'furkan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ('${ProjectKeys.welcome} $name'),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
          style: ProjectStyles.welcomeStyle,
        ),
        Text(
          ('${ProjectKeys.welcome} $name'),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.headline5?.copyWith(color: ProjectColors.textColor),
        )
      ],
    )));
  }
}

class ProjectStyles {
  static TextStyle get welcomeStyle => TextStyle(
      wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: ProjectColors.welcomeColor,
      letterSpacing: 2,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
  static Color textColor = Colors.yellow;
}

class ProjectKeys {
  static const String welcome = 'Merhaba';
}
