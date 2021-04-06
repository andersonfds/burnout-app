import 'package:app/pages/pages.dart';
import 'package:get/get.dart';

List<GetPage> getPages() => [
      GetPage(
        name: 'login',
        page: () => LoginPage(),
        binding: LoginBindings(),
      ),
      GetPage(
        name: 'home',
        page: () => HomePage(),
        binding: HomeBindings(),
        transition: Transition.fadeIn,
      ),
    ];
