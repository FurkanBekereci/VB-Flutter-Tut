import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            NonEmptyTextFormField(),
            NonEmptyNumberFormField(),
            ElevatedButton(
              onPressed: () {
                bool isValid = _key.currentState?.validate() ?? false;
                if (isValid) print('Helloo, you are valid!');
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}

class NonEmptyTextFormField extends TextFormField {
  NonEmptyTextFormField({
    Key? key,
  }) : super(
          key: key,
          validator: FormFieldValidator().isNotEmpty,
        );
}

class NonEmptyNumberFormField extends TextFormField {
  NonEmptyNumberFormField({
    Key? key,
  }) : super(
          key: key,
          inputFormatters: [
            NumberInputFormatter.getFormatter(),
          ],
        );
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : 'Bu alan boş bırakılamaz!';
  }
}

class NumberInputFormatter {
  static TextInputFormatter getFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.isNumber || newValue.text.isEmpty) return newValue;
      return oldValue;
    });
  }
}

extension String2Extension on String {
  bool get isNumber => num.tryParse(this) != null;
}
