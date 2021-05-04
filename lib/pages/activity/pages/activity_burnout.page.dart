import 'dart:math';

import 'package:app/core/models/activity/burnout.activity.dart';
import 'package:app/shared/services/services.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BurnoutActivityPage extends StatefulWidget {
  @override
  _BurnoutActivityPageState createState() => _BurnoutActivityPageState();
}

class _BurnoutActivityPageState extends State<BurnoutActivityPage> {
  IActivityService _activityService = Get.find();
  BurnoutActivityModel? _activityModel;
  int burnoutAmount = 0;

  var texts = [
    'Nunca ocorre',
    'Algumas vezes no ano ou menos',
    'Uma vez por mês ou menos',
    'Algumas vezes por mês',
    'Algumas vezes na semana',
    'Todo dia',
  ];

  int get burnoutIndex => min(5, burnoutAmount);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = ModalRoute.of(context)?.settings.arguments;

    if (settings is BurnoutActivityModel?) {
      _activityModel = settings;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${_activityModel?.question}',
                        style: Get.textTheme?.headline5,
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          texts[burnoutIndex],
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      WaveSlider(
                        sliderHeight: 30.0,
                        color: Get.theme?.primaryColor ?? Colors.white,
                        onChangeEnd: (data) {
                          setState(() {
                            burnoutAmount = (data * 7).floor();
                          });
                        },
                        onChanged: (data) {
                          setState(() {
                            burnoutAmount = (data * 7).floor();
                          });
                        },
                        onChangeStart: (data) {
                          setState(() {
                            burnoutAmount = (data * 7).floor();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _activityService.next(_activityModel),
                child: Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
