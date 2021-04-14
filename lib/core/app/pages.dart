import 'package:app/pages/pages.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

List<GetPage> getPages() => [
      GetPage(
        name: 'login',
        page: () => LoginPage(),
        binding: LoginBindings(),
        curve: Curves.ease,
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: 'home',
        page: () => HomePage(),
        binding: HomeBindings(),
        curve: Curves.ease,
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: 'activity/yesNo',
        page: () => ActivityYesNoPage(),
        binding: ActivityYesNoBindings(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: 'activity/image',
        page: () => ActivityImagePage(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: 'activity/selection',
        page: () => ActivitySelectionPage(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: 'activity/winner',
        page: () => ActivityWinnerPage(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: 'activity/text',
        page: () => ActivityTextPage(),
        curve: Curves.easeIn,
        transition: Transition.fadeIn,
      ),
    ];
