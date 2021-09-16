import 'package:app/core/models/models.dart';
import 'package:app/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Markdown(
                data: _textModel?.description ?? '',
                styleSheet: MarkdownStyleSheet.fromTheme(Get.theme).copyWith(
                  blockquoteDecoration: BoxDecoration(
                    color: Colors.white10,
                    border: Border(
                      left: BorderSide(color: Colors.white38, width: 4),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _textModel?.onCancel != null,
                    child: Expanded(
                      child: OutlinedButton(
                        onPressed: () => _activityService.next(
                            _textModel, _textModel?.onCancel),
                        child: Text('Não'),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _textModel?.onCancel != null,
                    child: SizedBox(width: 10),
                  ),
                  Expanded(
                    child: Hero(
                      tag: 'primary_button',
                      child: ElevatedButton(
                        onPressed: () => _activityService.next(
                            _textModel, _textModel?.onAccept),
                        child: Text(
                          _textModel?.onCancel != null ? 'Sim' : 'Continuar',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
