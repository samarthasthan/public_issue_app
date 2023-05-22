import 'package:app/constants.dart';
import 'package:app/views/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              filled: true, //<-- SEE HERE
              fillColor: whiteColor, //<-- SEE HERE
            ),
          ),
          home: MainMenu(),
        );
      },
    );
  }
}
