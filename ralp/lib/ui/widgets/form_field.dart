// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FormLine extends StatelessWidget {
  final String label;

  const FormLine(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 49, right: 72, bottom: 7),
      child: TextField(
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
          color: Color(0xffFFFFFF),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
            color: Color(0xffFFFFFF),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff86878B), width: 1.0, style: BorderStyle.solid),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff86878B), width: 1.0, style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }
}
