import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldView extends StatefulWidget {
  const TextFieldView({Key? key}) : super(key: key);

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              maxLength: 20,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              inputFormatters: [ProjectTextInputFormatter.inputFormatter],
              buildCounter: (BuildContext context,
                  {required int currentLength, required bool isFocused, int? maxLength}) {
                return const Text('Hellooo');
              },
              textInputAction: TextInputAction.next,
              decoration: _InputDecorator.emailInputDecorator,
            ),
            const TextField(
              textInputAction: TextInputAction.done,
            )
          ],
        ));
  }
}

class ProjectTextInputFormatter {
  static final inputFormatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text.contains('a')) return oldValue;
    return newValue;
  });
}

class _InputDecorator {
  static const emailInputDecorator =
      InputDecoration(prefixIcon: Icon(Icons.mail), border: OutlineInputBorder(), labelText: 'Mail');
}
