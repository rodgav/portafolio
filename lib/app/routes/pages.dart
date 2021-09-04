import 'package:get/get.dart';
import 'package:portafolio/app/modules/home/home_binding.dart';
import 'package:portafolio/app/modules/home/home_view.dart';
import 'package:portafolio/app/modules/splash/splash_binding.dart';
import 'package:portafolio/app/modules/splash/splash_view.dart';

class Pages {
  static final List<GetPage> pages = [
    GetPage(
      name: '/splash',
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}