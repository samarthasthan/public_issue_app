import 'dart:convert';

import 'package:app/views/authentication/loginScreen.dart';
import 'package:app/views/mainMenu.dart';
import 'package:app/views/widgets/buttons/basicButton.dart';
import 'package:app/views/widgets/textfields/basicTextField.dart';
import 'package:app/views/widgets/texts/heading.dart';
import 'package:app/views/widgets/texts/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../models/authentication/signUpModel.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: appBarElevation,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: paddingHeight,
            ),
            SizedBox(
              height: paddingHeight,
            ),
            Center(
              child: Heading(
                text: 'Creating account is fast and easy!',
                isCenterAlign: true,
                isBold: false,
                textColor: blackColor,
              ),
            ),
            SizedBox(
              height: paddingHeight,
            ),
            BasicTextField(hintText: 'Mobile Number'),
            SizedBox(
              height: paddingHeight,
            ),
            BasicTextField(hintText: 'Email ID'),
            SizedBox(
              height: paddingHeight,
            ),
            SizedBox(
              height: 5.h,
            ),
            Visibility(
              visible: false,
              child: SizedBox(
                width: utilsWidth,
                child: Paragraph(
                    text: '',
                    textColor: redColor,
                    isCenterAlign: false,
                    isBold: false),
              ),
            ),
            SizedBox(
              width: utilsWidth,
              child: Paragraph(
                  text:
                      'Our app uses Aadhar to verify identity to the user and also enable authentic document access',
                  textColor: greyColor,
                  isCenterAlign: false,
                  isBold: false),
            ),
            SizedBox(
              height: paddingHeight,
            ),
            GestureDetector(
              child: BasicButton(buttonText: "Submit"),
              onTap: () async {
                SignUpModel signUpResponse = await loginController.login();
                String? message = signUpResponse.data;
                print(message); // Access the message value

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MainMenu(),
                //   ),
                // );
              },
            ),
            SizedBox(
              height: paddingHeight,
            ),
            SizedBox(
              width: utilsWidth,
              child: Paragraph(
                  text:
                      'By signing up, you agree to Our App’sTerms of service Privacy Policy Content Policy',
                  textColor: greyColor,
                  isCenterAlign: false,
                  isBold: false),
            ),
            SizedBox(
              height: paddingHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Paragraph(
                    text: 'Already have an account?',
                    textColor: blackColor,
                    isCenterAlign: true,
                    isBold: false),
                GestureDetector(
                  child: Paragraph(
                      text: ' Login',
                      textColor: primaryColor,
                      isCenterAlign: true,
                      isBold: false),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
