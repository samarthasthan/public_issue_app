// ignore_for_file: must_be_immutable

import 'dart:io';
import 'dart:typed_data';

import 'package:app/constants.dart';
import 'package:app/views/widgets/buttons/basicButton.dart';
import 'package:app/views/widgets/textfields/basicTextField.dart';
import 'package:app/views/widgets/texts/heading.dart';
import 'package:app/views/widgets/texts/paragraph.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class NewComplaintScreen extends StatefulWidget {
  NewComplaintScreen({super.key});

  @override
  State<NewComplaintScreen> createState() => _NewComplaintScreenState();
}

class _NewComplaintScreenState extends State<NewComplaintScreen> {
  List<File> files = [];

  RxList final_files = [].obs;
  RxBool isLoading = false.obs;

  Future selectfile() async {
    isLoading.value = true;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.media,
    );

    if (result != null) {
      final newFiles = result.paths.map((path) => File(path!)).toList();

      for (var i in newFiles) {
        final existingIndex =
            files.indexWhere((existingFile) => existingFile.path == i.path);

        if (existingIndex != -1) {
          // File already exists, replace it
          files[existingIndex] = i;
        } else {
          // File doesn't exist, add it
          files.add(i);
        }
      }

      final_files.clear(); // Clear the old list before updating
      for (var i in files) {
        if (i.path.endsWith('.jpeg') ||
            i.path.endsWith('.png') ||
            i.path.endsWith('.jpg')) {
          final_files.add(i.path);
        } else {
          final_files.add(await generateThumbnail(i.path));
        }
      }
    } else {
      // User canceled the picker
    }
    isLoading.value = false;
  }

  Future<Uint8List?> generateThumbnail(filepath) async {
    //print(filepath);
    var thumb = await VideoThumbnail.thumbnailData(video: filepath.toString());

    return thumb;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Stack(alignment: Alignment.center, children: [
            Obx(
              () => IgnorePointer(
                ignoring: isLoading.isTrue ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Heading(
                        text: "Create Complain",
                        textColor: blackColor,
                        isCenterAlign: true,
                        isBold: true),
                    SizedBox(
                      height: paddingHeight * 3,
                    ),
                    BasicTextField(hintText: "Title"),
                    SizedBox(
                      height: paddingHeight,
                    ),
                    SizedBox(
                      width: utilsWidth,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Paragraph(
                            text: "Describe your issue",
                            textColor: darkgreyColor,
                            isCenterAlign: false,
                            isBold: false),
                      ),
                    ),
                    SizedBox(
                      height: paddingHeight,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: utilsWidth,
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
                    ),
                    SizedBox(
                      height: paddingHeight,
                    ),
                    SizedBox(
                      width: utilsWidth,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Paragraph(
                            text: "Click or upload media",
                            textColor: darkgreyColor,
                            isCenterAlign: false,
                            isBold: false),
                      ),
                    ),
                    SizedBox(
                      height: paddingHeight,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectfile();
                      },
                      child: Container(
                        height: 142.h,
                        width: utilsWidth,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/media_video.svg'),
                                  Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(
                                      Icons.add,
                                      color: whiteColor,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      'assets/icons/media_image.svg'),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: paddingWidth,
                                    vertical: paddingHeight),
                                child: Paragraph(
                                    text:
                                        'Upload photos and a video of less than 15 seconds.',
                                    textColor: darkgreyColor,
                                    isCenterAlign: false,
                                    isBold: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => final_files.isNotEmpty
                          ? SizedBox(
                              width: utilsWidth,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: paddingHeight,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Paragraph(
                                        text: "Seleted Files",
                                        textColor: darkgreyColor,
                                        isCenterAlign: false,
                                        isBold: false),
                                  ),
                                  SizedBox(
                                    height: paddingHeight / 2,
                                  ),
                                  SizedBox(
                                    height: 150.h,
                                    width: utilsWidth,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: final_files.length,
                                        itemBuilder: (context, index) {
                                          return final_files[index]
                                                          .toString()
                                                          .split('.')
                                                          .last ==
                                                      'jpeg' ||
                                                  final_files[index]
                                                          .toString()
                                                          .split('.')
                                                          .last ==
                                                      'png' ||
                                                  final_files[index]
                                                          .toString()
                                                          .split('.')
                                                          .last ==
                                                      'jpg'
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        final_files.remove(
                                                            final_files[index]);
                                                      },
                                                      child: Image.asset(
                                                        final_files[index],
                                                        width: 100.w,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              final_files.remove(
                                                                  final_files[
                                                                      index]);
                                                            },
                                                            child: Image.memory(
                                                              final_files[
                                                                  index],
                                                              width: 100.w,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons.videocam,
                                                        color: whiteColor,
                                                      ),
                                                    ]);
                                        }),
                                  ),
                                ],
                              ),
                            )
                          : const Text(''),
                    ),
                    const Spacer(),
                    SafeArea(child: BasicButton(buttonText: "Submit")),
                  ],
                ),
              ),
            ),
            Obx(() => Visibility(
                  visible: isLoading.isTrue ? true : false,
                  child: Container(
                    height: 150.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoActivityIndicator(
                          color: whiteColor,
                        ),
                        SizedBox(
                          height: paddingHeight,
                        ),
                        Paragraph(
                            text: "Loading Files.....",
                            textColor: whiteColor,
                            isCenterAlign: true,
                            isBold: true)
                      ],
                    ),
                  ),
                ))
          ]),
        )
      ],
    ));
  }
}
