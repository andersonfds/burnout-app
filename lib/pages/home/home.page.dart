import 'package:app/pages/home/home.controller.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class BottomHomeMenu extends StatelessWidget {
  final int selectedItem;
  final ValueChanged<int>? onChanged;

  const BottomHomeMenu({
    Key? key,
    required this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 2,
      currentIndex: selectedItem,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Get.theme?.primaryColor,
      backgroundColor: Colors.white,
      onTap: onChanged,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.game_controller_outline),
          activeIcon: Icon(Ionicons.game_controller),
          label: 'Jogar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.star_outline),
          activeIcon: Icon(Ionicons.star),
          label: 'Progresso',
        ),
      ],
    );
  }
}

class HomeHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GradientContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hello, Anderson',
                style: Get.textTheme?.headline6?.apply(color: Colors.white),
              ),
            ),
          ),
          Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/seed/j/120/120'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HomeHeader(),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => LevelCard(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomHomeMenu(
          selectedItem: controller.selectedPage.value,
          onChanged: controller.setPage,
        ),
      ),
    );
  }
}
