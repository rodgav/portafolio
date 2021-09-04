import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio/utils/colors_utils.dart';

import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  final logic = Get.find<SplashLogic>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashLogic>(builder: (_) {
      return Scaffold(
        backgroundColor: ColorsUtils.morado2,
        body: Center(
          child: Text(
            'title'.tr,
            style: TextStyle(color: ColorsUtils.white, fontSize: 30),
          ),
        ),
      );
    });
  }
}
