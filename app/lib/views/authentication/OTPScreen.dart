import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:app/constants.dart';
import 'package:app/views/mainMenu.dart';
import 'package:app/views/widgets/buttons/basicButton.dart';
import 'package:app/views/widgets/texts/heading.dart';
import 'package:app/views/widgets/texts/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

var isOTPWrong = false.obs;
var enteredOTP = ''.obs;

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: blackColor,
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: utilsWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Heading(
                    text: 'We have sent a verification code to phone number',
                    textColor: blackColor,
                    isCenterAlign: true,
                    isBold: false),
                SizedBox(
                  height: paddingHeight,
                ),
                Paragraph(
                    text: 'Sent to +91 9557037766',
                    textColor: greyColor,
                    isCenterAlign: true,
                    isBold: true),
                SizedBox(
                  height: paddingHeight,
                ),
                SizedBox(
                  height: paddingHeight,
                ),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: greyColor,
                  focusedBorderColor: greyColor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) async {
                    isOTPWrong.value = false;
                    enteredOTP.value = code;
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) async {
                    if (verificationCode != "12345") {
                      isOTPWrong.value = true;
                    } else {
                      isOTPWrong.value = false;
                      var isTokenExist = await APICacheManager()
                          .isAPICacheKeyExist("access_token");
                      if (!isTokenExist) {
                        APICacheDBModel cacheDBModel = APICacheDBModel(
                            key: "access_token", syncData: access_token);
                        await APICacheManager().addCacheData(cacheDBModel);
                      }

                      Get.off(MainMenu());
                    }
                  }, // end onSubmit
                ),
                SizedBox(
                  height: paddingHeight,
                ),
                Obx(
                  () => Visibility(
                    visible: isOTPWrong.isFalse ? false : true,
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: Paragraph(
                        text:
                            'The OTP you enterd is invalid, Please enter the correct OTP',
                        textColor: redColor,
                        isCenterAlign: true,
                        isBold: false),
                  ),
                ),
                SizedBox(
                  height: paddingHeight,
                ),
                SizedBox(
                  height: paddingHeight,
                ),
                Paragraph(
                    text: "Didn't get OTP?",
                    textColor: greyColor,
                    isCenterAlign: true,
                    isBold: true),
                SizedBox(
                  height: 2.h,
                ),
                Paragraph(
                    text: "Resend OTP",
                    textColor: primaryColor,
                    isCenterAlign: true,
                    isBold: true),
                SizedBox(
                  height: paddingHeight,
                ),
                InkWell(
                  child: BasicButton(buttonText: 'Verify and continue'),
                  onTap: () async {
                    if (enteredOTP.value != "12345") {
                      isOTPWrong.value = true;
                    } else {
                      isOTPWrong.value = false;
                      var isTokenExist = await APICacheManager()
                          .isAPICacheKeyExist("access_token");
                      if (!isTokenExist) {
                        APICacheDBModel cacheDBModel = APICacheDBModel(
                            key: "access_token", syncData: access_token);
                        await APICacheManager().addCacheData(cacheDBModel);
                      }

                      Get.off(MainMenu());
                    }
                  },
                ),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
