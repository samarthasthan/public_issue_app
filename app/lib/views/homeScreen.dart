// ignore_for_file: must_be_immutable

import 'package:app/constants.dart';
import 'package:app/views/widgets/textfields/basicTextField.dart';
import 'package:app/views/widgets/texts/heading.dart';
import 'package:app/views/widgets/texts/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  DraggableScrollableController sheetController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: (constraints.maxHeight / 2).h,
              child: const Column(
                children: [TopWidgets()],
              ),
            );
          },
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.66,
          minChildSize: 0.66,
          maxChildSize: 1,
          controller: sheetController,
          builder: ((context, scrollController) {
            return SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: greyColor, //New
                        blurRadius: 10.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    ListView.builder(
                        controller: scrollController,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return const SheetWidgets();
                        }),
                    SizedBox(
                      width: 50.w,
                      child: const Divider(
                        thickness: 5,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        )
      ]),
    );
  }
}

class SheetWidgets extends StatelessWidget {
  const SheetWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.h, right: 20.w, left: 20.w),
          child: Row(
            children: [
              Paragraph(
                  text: "Sort by",
                  textColor: primaryColor,
                  isCenterAlign: false,
                  isBold: false),
              Paragraph(
                  text: " DATE ADDED ",
                  textColor: blackColor,
                  isCenterAlign: false,
                  isBold: false),
              Icon(
                Icons.arrow_downward_rounded,
                size: 15.sp,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: SizedBox(
            height: 32.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 20.w : 5.w),
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: index == 0 ? primaryColor : lightPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Center(
                        child: Paragraph(
                            text: index == 0 ? 'All' : "Water",
                            textColor: index == 0 ? whiteColor : blackColor,
                            isCenterAlign: true,
                            isBold: false),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30.h,
                width: 175.w,
                decoration: BoxDecoration(
                    color: lightPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Paragraph(
                      text: "Active",
                      textColor: primaryColor,
                      isCenterAlign: true,
                      isBold: false),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                height: 30.h,
                width: 175.w,
                decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Paragraph(
                      text: "Inactive",
                      textColor: blackColor,
                      isCenterAlign: true,
                      isBold: false),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 20.w),
                child: Container(
                  width: 323.w,
                  height: 70.h,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: greyColor, //New
                          blurRadius: 1.0,
                          offset: Offset(0, 0))
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 4.w,
                        decoration: BoxDecoration(
                          color: (index % 2) == 0 ? primaryColor : Colors.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sewage Blockage',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Posted by: ',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  'Samarth Asthan',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: primaryColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'In-charge: ',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  'Aditya Roy',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Reg date',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                                Text(
                                  '14th',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  'May',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0.sp),
                              child: Container(
                                height: double.infinity,
                                width: 1.2.w,
                                color: greyColor,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Due date',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                                Text(
                                  '28th',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  'May',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.sp,
                      )
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}

class TopWidgets extends StatelessWidget {
  const TopWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/bigAppBarBackground.svg',
          width: 390.w,
          height: 360.h,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Heading(
                            text: "Hi! Samarth Asthan",
                            textColor: whiteColor,
                            isCenterAlign: false,
                            isBold: true),
                        Paragraph(
                            text: "110037-SOUTH WEST DELHI",
                            textColor: whiteColor,
                            isCenterAlign: false,
                            isBold: true),
                      ],
                    ),
                    SizedBox(
                      height: 54.h,
                      width: 54.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://pikwizard.com/pw/small/39573f81d4d58261e5e1ed8f1ff890f6.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: paddingHeight,
                ),
                BasicTextField(
                    hintText: 'Search complaints, issues, Initiatives...'),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 94.h,
                  width: 328.w,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: greyColor, //New
                          blurRadius: 1.0,
                          offset: Offset(0, 0))
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Heading(
                                text: '05',
                                textColor: blackColor,
                                isCenterAlign: false,
                                isBold: true),
                            Paragraph(
                                text: 'Registered\ncomplaint',
                                textColor: blackColor,
                                isCenterAlign: true,
                                isBold: true)
                          ],
                        ),
                        Container(
                          width: 1.w,
                          color: greyColor,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Heading(
                                text: '03',
                                textColor: blackColor,
                                isCenterAlign: false,
                                isBold: true),
                            Paragraph(
                                text: 'Closed\ncomplaint',
                                textColor: blackColor,
                                isCenterAlign: true,
                                isBold: true)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
