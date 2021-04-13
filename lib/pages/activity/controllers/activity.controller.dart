import 'package:app/shared/widgets/wave_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController
    with SingleGetTickerProviderMixin {
  PageController pageController = PageController();
  late WaveSliderController waveController = WaveSliderController(vsync: this);
  RxDouble value = 0.0.obs;
  Rx<SliderState> sliderState = SliderState.resting.obs;

  RxList<int> items = <int>[1, 2, 3, 4, 5, 6].obs;
  RxList<int> accepted = <int>[].obs;
  RxList<int> rejected = <int>[].obs;

  final stopsNear = <int>[0, 1, 2, 3, 4];

  void onChanged(double value) {
    if (value > 0.4) {
      waveController.controller.animateTo(0.1);
    }
  }

  @override
  void onClose() {
    super.onClose();
    waveController.dispose();
  }
}
