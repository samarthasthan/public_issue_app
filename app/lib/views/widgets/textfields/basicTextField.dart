// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../constants.dart';

class BasicTextField extends StatelessWidget {
  BasicTextField({super.key, required this.hintText});

  String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: utilsHeight,
      width: utilsWidth,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: greyColor), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: greyColor,
            ), //<-- SEE HERE
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
