import 'package:app/constants.dart';

import 'package:app/views/widgets/buttons/basicButton.dart';
import 'package:app/views/widgets/textfields/basicTextField.dart';
import 'package:app/views/widgets/texts/heading.dart';
import 'package:app/views/widgets/texts/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewComplaintScreen extends StatelessWidget {
  const NewComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: false,
        elevation: 0,
        title: Heading(
            text: 'Register Complaint',
            textColor: whiteColor,
            isCenterAlign: true,
            isBold: true),
        flexibleSpace: SvgPicture.asset(
          'assets/smallAppBarBackground.svg',
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          width: utilsWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: paddingHeight,
              ),
              BasicTextField(hintText: "Samarth Asthan"),
              SizedBox(
                height: paddingHeight,
              ),
              BasicTextField(hintText: "+919557037766"),
              SizedBox(height: paddingHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Paragraph(
                    text: "Click or upload media",
                    textColor: darkgreyColor,
                    isCenterAlign: false,
                    isBold: true),
              ),
              SizedBox(
                height: paddingHeight / 4,
              ),
              Container(
                height: 162.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: primaryColor, width: 1),
                    color: lightPrimaryColor.withOpacity(.5)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/icons/media_video.svg'),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                              Icons.add,
                              color: whiteColor,
                            ),
                          ),
                          SvgPicture.asset('assets/icons/media_image.svg'),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingWidth, vertical: paddingHeight),
                        child: Paragraph(
                            text:
                                'Upload photos and a video of less than 15 seconds.',
                            textColor: darkgreyColor,
                            isCenterAlign: false,
                            isBold: false),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: paddingHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Paragraph(
                    text: "Describe your issue",
                    textColor: darkgreyColor,
                    isCenterAlign: false,
                    isBold: true),
              ),
              SizedBox(
                height: paddingHeight / 4,
              ),
              Expanded(
                child: TextField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                        color: darkgreyColor,
                        fontSize: 14.sp,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.normal),
                    hintText:
                        "Explain breifly about yours or society problem...",
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
              Spacer(),
              SafeArea(child: BasicButton(buttonText: "Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
