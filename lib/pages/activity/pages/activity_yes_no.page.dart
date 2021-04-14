import 'package:app/core/models/activity/yes_no.activity.model.dart';
import 'package:app/shared/services/services.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityYesNoPage extends StatefulWidget {
  @override
  _ActivityYesNoPageState createState() => _ActivityYesNoPageState();
}

class _ActivityYesNoPageState extends State<ActivityYesNoPage> {
  IActivityService _activityService = Get.find();
  YesNoActivityModel? _questionModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = ModalRoute.of(context)?.settings.arguments;

    if (settings is YesNoActivityModel?) {
      _questionModel = settings;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Illustration.name('doctors'),
                  ),
                  Text(
                    _questionModel?.title ?? 'unknown',
                    style: Get.textTheme?.headline5,
                  ),
                  Text(
                    _questionModel?.description ?? 'unknown',
                    style: Get.textTheme?.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Não'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Hero(
                    tag: 'primary_button',
                    child: ElevatedButton(
                      onPressed: () => _activityService
                          .triggerActivity(_questionModel?.goNext ?? 0),
                      child: Text('Sim'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
