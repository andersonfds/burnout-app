import 'package:app/core/models/activity/result.activity.dart';
import 'package:app/shared/services/iactivity.service.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityLevelStress extends StatefulWidget {
  @override
  _ActivityLevelStressState createState() => _ActivityLevelStressState();
}

class _ActivityLevelStressState extends State<ActivityLevelStress> {
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

  onContinue() {
    final points = _resultModel?.receivedPoints ?? 0;
    if (points > 0) {
      Get.offAllNamed(
        '/activity/winner',
        arguments: _resultModel,
        predicate: (route) => route.settings.name == '/home',
      );
    } else {
      Get.back();
    }
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
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomGauge(
                        value: activityBurnoutIndex,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Seu nível é',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        _resultModel?.burnoutValue ?? 'Desconhecido',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline6,
                      ),
                      Text(
                        'Você fez ${_resultModel?.burnoutIndex} pontos!',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: onContinue,
                child: Text('Continuar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
