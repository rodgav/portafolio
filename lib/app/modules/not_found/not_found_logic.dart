import 'package:get/get.dart';

class NotFoundLogic extends GetxController {
  void goSplash() {
    Get.offNamedUntil('/splash', (route) => false);
  }
}
