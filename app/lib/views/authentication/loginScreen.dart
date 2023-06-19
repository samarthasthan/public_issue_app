import 'package:app/constants.dart';
import 'package:app/controllers/loginController.dart';
import 'package:app/views/authentication/signupScreen.dart';
import 'package:app/views/widgets/texts/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/buttons/basicButton.dart';
import 'package:flutter/services.dart';
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
        child: Center(
          child: SizedBox(
            width: utilsWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: 'App Logo',
                    isBold: true,
                    isCenterAlign: true,
                    textColor: blackColor,
                  ),
                ),
                SizedBox(
                  height: paddingHeight,
                ),
                SizedBox(
                  height: utilsHeight,
                  width: utilsWidth,
                  child: TextField(
                    controller: textFieldContoller,
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      hintText: "Enter your mobile number.",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: greyColor), //<-- SEE HERE
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
                ),
                Obx(
                  () => Visibility(
                    visible:
                        loginController.validUser.value == true ? true : false,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.sp, left: 2.sp),
                      child: Paragraph(
                          text: "User not found.",
                          textColor: redColor,
                          isCenterAlign: false,
                          isBold: false),
                    ),
                  ),
                ),
                SizedBox(
                  height: paddingHeight,
                ),
                GestureDetector(
                  child: BasicButton(
                    buttonText: "Get OTP",
                  ),
                  onTap: () async {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    loginController.togglevalidUser();
                  },
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: paddingHeight,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 9.h),
                      child: Paragraph(
                        text:
                            'By verifying your number, you agree to our Terms of service Privacy Policy Content Policy',
                        textColor: greyColor,
                        isCenterAlign: true,
                        isBold: false,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final loginController = Get.put(LoginController());
final textFieldContoller = TextEditingController();
