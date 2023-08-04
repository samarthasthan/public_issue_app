import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:app/constants.dart';
import 'package:app/controllers/loginCheckController.dart';
import 'package:app/views/authentication/loginScreen.dart';
import 'package:app/views/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final logincheckController = Get.put(LoginCheckController());
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var isTokenExist = await APICacheManager().isAPICacheKeyExist("access_token");
  if (isTokenExist) {
    bool result = await logincheckController.checkLogin();
    if (result == true) {
      runApp(const HomeAPP());
    } else {
      runApp(const HomeAPP());
    }
  } else {
    runApp(const LoginApp());
  }
}

class LoginApp extends StatelessWidget {
  const LoginApp({
    super.key,
  });

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
            home: const LoginScreen(),
          );
        });
  }
}

class HomeAPP extends StatelessWidget {
  const HomeAPP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(platform: TargetPlatform.iOS),
            home: const MainMenu(),
          );
        });
  }
}
