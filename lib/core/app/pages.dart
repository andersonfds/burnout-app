import 'package:app/pages/pages.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

List<GetPage> getPages() => [
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        binding: LoginBindings(),
        curve: Curves.ease,
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/home',
        page: () => HomePage(),
        binding: HomeBindings(),
        curve: Curves.ease,
        transition: Transition.fadeIn,
      ),
      GetPage(
        name: '/signup',
        page: () => SignupPage(),
        binding: SignupBindings(),
        curve: Curves.ease,
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: '/signup/confirm',
        page: () => ConfirmPage(),
        binding: ConfirmBindings(),
        curve: Curves.ease,
        transition: Transition.rightToLeftWithFade,
      ),
      GetPage(
        name: '/activity/image',
        page: () => ActivityImagePage(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/activity/selection',
        page: () => ActivityOptionPage(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/activity/winner',
        page: () => ActivityWinnerPage(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/activity/results',
        page: () => ActivityLevelStress(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/activity/text',
        page: () => ActivityTextPage(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/activity/burnout',
        page: () => BurnoutActivityPage(),
        curve: Curves.easeIn,
        transition: Transition.rightToLeft,
      ),
    ];
