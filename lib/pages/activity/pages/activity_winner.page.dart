import 'package:app/shared/widgets/coin_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/win_widget.dart';

class ActivityWinnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WinWidget(),
                  Text(
                    'Parabéns! Você alcançou o Nível 1',
                    style: Get.textTheme?.headline6,
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CoinIcon(
                        coins: 2000,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: Get.back,
              child: Text('Continuar'),
            ),
          ),
        ],
      ),
    );
  }
}
