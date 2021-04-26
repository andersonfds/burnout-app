import 'package:app/core/models/models.dart';
import 'package:app/pages/activity/widgets/widgets.dart';
import 'package:app/shared/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityOptionPage extends StatefulWidget {
  @override
  _ActivityOptionPageState createState() => _ActivityOptionPageState();
}

class _ActivityOptionPageState extends State<ActivityOptionPage> {
  IActivityService _activityService = Get.find();
  OptionsActivityModel? _selectionModel;
  List<String?> values = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = ModalRoute.of(context)?.settings.arguments;

    if (settings is OptionsActivityModel?) {
      _selectionModel = settings;
    }

    setState(() {});
  }

  _handleMultipleSelection(OptionItem? opt) {
    if (values.contains(opt?.value)) {
      values.remove(opt?.value);
    } else {
      values.add(opt?.value);
    }
    setState(() {});
  }

  _handleSingleSelection(OptionItem? item) {
    values.clear();
    values.add(item?.value);
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
              child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _selectionModel?.options?.length ?? 0,
                  itemBuilder: (context, index) {
                    final option = _selectionModel?.options?.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ActivityTile(
                        option: option,
                        selected: values.contains(option?.value),
                        onChanged: (opt) {
                          switch (_selectionModel?.mode) {
                            case 'multiple':
                              return _handleMultipleSelection(option);
                            case 'single':
                              return _handleSingleSelection(option);
                          }
                        },
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: 'primary_button',
                child: ElevatedButton(
                  onPressed: () => _activityService.next(_selectionModel),
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
