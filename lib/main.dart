import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '_core/lang/language_manager.dart';
import '_core/navigation/navigation_route.dart';
import '_core/theme/app_theme.dart';
import 'view/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      title: "Flutter Demo",
      theme: AppTheme.instance.lightTheme,
      darkTheme: AppTheme.instance.darkTheme,
      locale: LanguageManager.instance.locale,
      fallbackLocale: LanguageManager.instance.fallbackLocale,
      translations: LanguageManager.instance,
      home: MainPage(),
      getPages: NavigationRoute.instance.routes,
    );
  }
}
