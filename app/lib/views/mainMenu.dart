import 'package:app/constants.dart';
import 'package:app/views/homeScreen.dart';
import 'package:app/views/newComplaint.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;

  void _showBottomSheet() {
    showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      builder: (context) => Container(
        child: NewComplaintScreen(),
        padding: EdgeInsets.all(16.0.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [HomeScreen(), NewComplaintScreen(), HomeScreen()],
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
        height: 89.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedFontSize: 11.0,
          unselectedFontSize: 11.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: _currentIndex,
          onTap: (int index) {
            if (index == 1) {
              _showBottomSheet();
            } else {
              setState(() => _currentIndex = index);
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home-outline.svg',
                  colorFilter: const ColorFilter.mode(
                    greyColor,
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/people-outline.svg',
                  colorFilter: const ColorFilter.mode(
                    greyColor,
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/people.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Add'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/person-outline.svg',
                  colorFilter: const ColorFilter.mode(
                    greyColor,
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/person.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }

  @override
  // ignore: todo
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
