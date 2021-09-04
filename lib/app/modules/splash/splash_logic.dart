import 'package:get/get.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    _init();
    super.onReady();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 3), () async {
      Get.offNamedUntil('/home', (route) => false);
    });
  }
}
