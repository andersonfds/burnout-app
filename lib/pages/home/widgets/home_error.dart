import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeError extends StatelessWidget {
  final VoidCallback? onLoad;

  const HomeError({Key? key, this.onLoad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Illustration.name(
                'moon',
                width: 200,
                height: 200,
              ),
            ),
            Text(
              'Não foi possível carregar os dados',
              style: Get.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: onLoad,
                child: Text('Tente de novo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
