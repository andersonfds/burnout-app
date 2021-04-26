import 'package:app/pages/home/controllers/home.controller.dart';
import 'package:app/pages/home/widgets/home_empty.dart';
import 'package:app/pages/home/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  getOptions(
          [dynamic Function(int, CarouselPageChangedReason)? onPageChanged]) =>
      CarouselOptions(
        viewportFraction: 3 / 4,
        height: double.infinity,
        enlargeCenterPage: true,
        onPageChanged: onPageChanged,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => HomeBottomActions(
          coins: controller.coins.value ?? 0,
          onUnlock: controller.onUnlockTap,
          onPlay: controller.onActivityTap,
          locked: !controller.selectionUnlocked,
          loading: controller.loading.value,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => HomeHeader(user: controller.user.value?.user)),
            Expanded(
              child: controller.obx(
                (state) => CarouselSlider.builder(
                  carouselController: controller.carousel,
                  options: getOptions((index, reason) {
                    controller.selected.value = index;
                  }),
                  itemCount: state?.length ?? 0,
                  itemBuilder: (context, index, index2) => HomeActivityCard(
                    activity: state![index],
                    onTap: () => controller.onActivityTap,
                  ),
                ),
                onLoading: CarouselSlider.builder(
                  options: getOptions(),
                  itemBuilder: (context, index, index2) =>
                      HomeActivityScaffoldCard(),
                  itemCount: 1,
                ),
                onEmpty: HomeEmpty(),
                onError: (error) => HomeError(
                  onLoad: controller.loadActivities,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
