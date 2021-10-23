import 'package:app/core/models/activity/result.activity.dart';
import 'package:app/shared/widgets/coin_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/win_widget.dart';

class ActivityWinnerPage extends StatefulWidget {
  @override
  State<ActivityWinnerPage> createState() => _ActivityWinnerPageState();
}

class _ActivityWinnerPageState extends State<ActivityWinnerPage> {
  ResultActivityModel? _resultModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = ModalRoute.of(context)?.settings.arguments;

    if (settings is ResultActivityModel?) {
      _resultModel = settings;
    }

    setState(() {});
  }

  double get activityBurnoutIndex {
    return (_resultModel?.burnoutIndex ?? 0) / 40.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: WinWidget(
                      levelNumber: _resultModel?.nextLevel ?? 0,
                    )),
                    Text(
                      'Parabéns! Você alcançou o Nível ${_resultModel?.nextLevel}',
                      style: Get.textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CoinIcon(
                          coins: _resultModel?.receivedPoints ?? 0,
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
                child: Text('Uhull!!!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
