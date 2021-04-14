import 'package:app/core/models/models.dart';
import 'package:app/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityTextPage extends StatefulWidget {
  @override
  _ActivityTextPageState createState() => _ActivityTextPageState();
}

class _ActivityTextPageState extends State<ActivityTextPage> {
  IActivityService _activityService = Get.find();
  TextActivityModel? _textModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = ModalRoute.of(context)?.settings.arguments;

    if (settings is TextActivityModel?) {
      _textModel = settings;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'lotrm dkslad ak dsamkl dalkdmldksa lsmaklsaklsd maskld alkmsd kla\n\ndaklms daslkd aklm askld smklskm lda kldaskl \n\n daskl mdasmkldasklm das mkld aklmmk ldasmkl daklmskm lda kldaskl \n\n daskl mdasmkldasklm das mkld aklmmk ldasmkl daklmskm lda kldaskl \n\n daskl mdasmkldasklm das mkld aklmmk ldasmkl daklm damkldamkld',
                  style: Get.textTheme?.subtitle1?.copyWith(
                    height: 3.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Hero(
              tag: 'primary_button',
              child: ElevatedButton(
                onPressed: () =>
                    _activityService.triggerActivity(_textModel?.goNext),
                child: Text('Continuar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
