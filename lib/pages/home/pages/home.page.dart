import 'package:app/pages/home/controllers/home.controller.dart';
import 'package:app/pages/home/widgets/home_empty.dart';
import 'package:app/pages/home/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  final CarouselOptions options = CarouselOptions(
    viewportFraction: 3 / 4,
    height: double.infinity,
    enlargeCenterPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomActions(),
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(name: 'Anderson'),
            Expanded(
              child: controller.obx(
                (state) => CarouselSlider.builder(
                  options: options,
                  itemBuilder: (context, index, index2) => HomeActivityCard(
                    activity: state![index],
                    onTap: () => controller.onActivityTap(state[index].id),
                  ),
                  itemCount: state?.length ?? 0,
                ),
                onLoading: CarouselSlider.builder(
                  options: options,
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
