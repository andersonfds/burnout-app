import 'package:app/core/app/app.bindings.dart';
import 'package:app/core/app/pages.dart';
import 'package:app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatelessWidget {
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages(),
      initialRoute: box.read('user') != null ? 'home' : 'login',
      initialBinding: AppBindings(),
      locale: Get.deviceLocale,
      fallbackLocale: Get.deviceLocale,
      supportedLocales: [Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
    );
  }
}
