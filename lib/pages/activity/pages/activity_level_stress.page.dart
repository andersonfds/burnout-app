import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityLevelStress extends StatefulWidget {
  @override
  _ActivityLevelStressState createState() => _ActivityLevelStressState();
}

class _ActivityLevelStressState extends State<ActivityLevelStress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomGauge(),
                      SizedBox(height: 20),
                      Text(
                        'Seu nível é',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Muito estressado',
                        textAlign: TextAlign.center,
                        style: Get.textTheme?.headline6,
                      ),
                      Text(
                        'Você fez 10 pontos',
                        textAlign: TextAlign.center,
                        style: Get.textTheme?.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: 'primary_button',
                child: ElevatedButton(
                  onPressed: Get.back,
                  child: Text('Continuar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
