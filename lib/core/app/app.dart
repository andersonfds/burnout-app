import 'package:app/core/app/app.bindings.dart';
import 'package:app/core/app/pages.dart';
import 'package:app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages(),
      initialRoute: 'login',
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
    );
  }
}
