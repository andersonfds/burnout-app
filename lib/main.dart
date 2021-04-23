import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'core/app/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
