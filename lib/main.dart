import 'package:flutter/widgets.dart';

import 'core/app/app.bindings.dart';
import 'core/app/app.dart';

void main() {
  AppBindings().dependencies();
  runApp(App());
}
