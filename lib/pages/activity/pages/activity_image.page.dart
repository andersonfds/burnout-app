import 'package:app/core/models/models.dart';
import 'package:app/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityImagePage extends StatefulWidget {
  @override
  _ActivityImagePageState createState() => _ActivityImagePageState();
}

class _ActivityImagePageState extends State<ActivityImagePage> {
  IActivityService _activityService = Get.find();
  ImageActivityModel? _questionModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = ModalRoute.of(context)?.settings.arguments;

    if (settings is ImageActivityModel?) {
      _questionModel = settings;
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
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  'https://picsum.photos/200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Hero(
              tag: 'primary_button',
              child: ElevatedButton(
                onPressed: null,
                child: Text('Continuar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
