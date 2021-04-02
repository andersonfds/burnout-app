import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // observables
  RxInt selectedPage = 0.obs;

  // controllables
  setPage(int index) => selectedPage.value = index;
}
