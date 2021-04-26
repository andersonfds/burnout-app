import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app/app.dart';

Future main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
