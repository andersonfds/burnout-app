import 'package:app/core/app/app.bindings.dart';
import 'package:app/core/app/pages.dart';
import 'package:app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages(),
      initialRoute: 'login',
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
