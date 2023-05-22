// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  Paragraph(
      {super.key,
      required this.text,
      required this.textColor,
      required this.isCenterAlign,
      required this.isBold});

  String text;
  Color textColor;
  bool isCenterAlign;
  bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontFamily: 'Helvetica',
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      textAlign: isCenterAlign ? TextAlign.center : TextAlign.start,
    );
  }
}
