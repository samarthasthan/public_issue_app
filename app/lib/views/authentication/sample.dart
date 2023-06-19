import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height2 = 200.h.obs;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Obx(
            () => Container(
              height: height2.value,
              color: Colors.red,
              width: 200,
            ),
          )),
          ElevatedButton(
              onPressed: () => height2 == 100.h
                  ? height2.value = 200.h
                  : height2.value = 100.h,
              child: Icon(Icons.handshake))
        ],
      ),
    );
  }
}
