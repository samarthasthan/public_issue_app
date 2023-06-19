import 'package:app/constants.dart';
import 'package:app/views/authentication/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              filled: true, //<-- SEE HERE
              fillColor: whiteColor, //<-- SEE HERE
            ),
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
