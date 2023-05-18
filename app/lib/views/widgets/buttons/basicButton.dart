// ignore_for_file: must_be_immutable

import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  BasicButton({super.key, required this.buttonText});

  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: utilsHeight,
      width: utilsWidth,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
          child: Text(
        buttonText,
        style: TextStyle(color: whiteColor),
      )),
    );
  }
}
