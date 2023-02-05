// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:first_project/demos/password_text_field.dart';

class PasswordTextFieldShow extends StatefulWidget {
  const PasswordTextFieldShow({Key? key}) : super(key: key);

  @override
  State<PasswordTextFieldShow> createState() => _PasswordTextFieldShowState();
}

class _PasswordTextFieldShowState extends State<PasswordTextFieldShow> {
  Product p = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: PasswordTextField(valueChanged: p.setName)),
    );
  }
}

class Product {
  String? _name;

  int? count;
  void setName(String s) {
    _name = s;
  }

  Product({
    String? name,
    this.count,
  }) {
    _name = name;
  }
}
