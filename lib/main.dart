import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio/app/modules/not_found/not_found_binding.dart';
import 'package:portafolio/app/modules/not_found/not_found_view.dart';
import 'package:portafolio/app/routes/pages.dart';
import 'package:portafolio/translations/app_translations.dart';
import 'package:portafolio/utils/colors_utils.dart';
import 'package:portafolio/utils/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'title'.tr,
      translations: AppTranslations(),
      locale: Locale('es', 'ES'),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: '/splash',
      getPages: Pages.pages,
      theme: ThemeData.light().copyWith(primaryColor: ColorsUtils.morado1),
      darkTheme: ThemeData.light().copyWith(primaryColor: ColorsUtils.morado2),
      themeMode: ThemeMode.dark,
      unknownRoute: GetPage(
          name: '/404',
          page: () => NotFoundPage('404'),
          binding: NotFoundBinding()),
    );
  }
}
