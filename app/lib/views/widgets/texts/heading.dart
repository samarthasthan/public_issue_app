// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heading extends StatelessWidget {
  Heading(
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
          fontSize: 16.sp,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      textAlign: isCenterAlign ? TextAlign.center : TextAlign.start,
    );
  }
}
