import 'package:flutter/material.dart';

typedef StringCallback = void Function(String s)?;

class PasswordTextField extends StatefulWidget {
  PasswordTextField({Key? key, this.valueChanged}) : super(key: key);
  StringCallback valueChanged;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isHidden = false;

  void setIsHidden() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          autofillHints: const [AutofillHints.password],
          keyboardType: TextInputType.visiblePassword,
          obscureText: _isHidden,
          obscuringCharacter: '☻',
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            hintText: 'Password',
            suffixIcon: _textVisibilityButton(),
            suffixIconColor: Colors.red,
          ),
          onChanged: widget.valueChanged,
        ),
      ],
    );
  }

  IconButton _textVisibilityButton() {
    return IconButton(
      iconSize: 30,
      onPressed: setIsHidden,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState: _isHidden ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 400),
      ),
      // icon:  Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
    );
  }

  // Bu benim yönetimidi.
  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     alignment: Alignment.centerRight,
  //     children: [
  //       TextField(
  //         autofillHints: const [AutofillHints.password],
  //         keyboardType: TextInputType.visiblePassword,
  //         obscureText: _isHidden,
  //         obscuringCharacter: '☻',
  //         decoration: const InputDecoration(border: UnderlineInputBorder(), hintText: 'Password'),
  //         onChanged: widget.valueChanged,
  //       ),
  //       IconButton(
  //         iconSize: 40,
  //         onPressed: () => setState(() {
  //           _isHidden = !_isHidden;
  //         }),
  //         icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
  //         alignment: Alignment.centerRight,
  //       )
  //     ],
  //   );
  // }

}
