import 'package:app/core/models/models.dart';
import 'package:app/pages/activity/widgets/widgets.dart';
import 'package:app/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitySelectionPage extends StatefulWidget {
  @override
  _ActivitySelectionPageState createState() => _ActivitySelectionPageState();
}

class _ActivitySelectionPageState extends State<ActivitySelectionPage> {
  IActivityService _activityService = Get.find();
  SelectionActivityModel? _selectionModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = ModalRoute.of(context)?.settings.arguments;

    if (settings is SelectionActivityModel?) {
      _selectionModel = settings;
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
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ActivityTile(
                  selected: index <= 4,
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
                    _activityService.triggerActivity(_selectionModel?.goNext),
                child: Text('Continuar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
