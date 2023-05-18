import 'package:app/constants.dart';
import 'package:app/views/authentication/signupScreen.dart';
import 'package:app/views/widgets/texts/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/buttons/basicButton.dart';
import '../widgets/textfields/basicTextField.dart';
import '../widgets/texts/heading.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          children: [
            SizedBox(
              height: 292.h,
            ),
            Center(
              child: Heading(
                text: 'App Logo',
                isBold: true,
                isCenterAlign: true,
                textColor: blackColor,
              ),
            ),
            SizedBox(
              height: paddingHeight,
            ),
            BasicTextField(
              hintText: 'Enter your mobile number',
            ),
            SizedBox(
              height: paddingHeight,
            ),
            BasicButton(
              buttonText: 'Get OTP',
            ),
            SizedBox(
              height: paddingHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Paragraph(
                  text: 'Don’t have an account?',
                  textColor: blackColor,
                  isCenterAlign: true,
                  isBold: false,
                ),
                GestureDetector(
                  child: Paragraph(
                    text: ' SignUp',
                    textColor: primaryColor,
                    isCenterAlign: true,
                    isBold: false,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Paragraph(
                text:
                    'By verifying your number, you agree to our Terms of service Privacy Policy Content Policy',
                textColor: blackColor,
                isCenterAlign: true,
                isBold: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
