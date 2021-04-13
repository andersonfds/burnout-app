import 'package:app/core/models/models.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class HomeActivityCard extends StatelessWidget {
  final ActivityModel activity;
  final VoidCallback? onTap;

  const HomeActivityCard({
    Key? key,
    required this.activity,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Card(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: NetworkImage(
                  'https://picsum.photos/seed/${activity.levelName}/600/600'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(activity.locked ? 0.7 : 0.3),
                BlendMode.darken,
              ),
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CoinIcon(
                            coins: activity.unlockPrice ?? activity.price,
                            color: Colors.white,
                          ),
                          Material(
                            color: Get.theme?.primaryColor,
                            shape: StadiumBorder(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                activity.flag ?? '',
                                style: Get.textTheme?.button?.apply(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            activity.levelName ?? '',
                            style: Get.textTheme?.overline,
                          ),
                          Text(
                            activity.name ?? '',
                            style: Get.textTheme?.headline6,
                          ),
                          Text(
                            activity.description ?? '',
                            style: Get.textTheme?.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                  visible: activity.locked,
                  child: Icon(
                    AntDesign.lock,
                    size: 42,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
