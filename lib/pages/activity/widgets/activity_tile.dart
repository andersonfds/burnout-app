import 'package:app/core/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class ActivityTile extends StatelessWidget {
  final OptionItem? option;
  final bool selected;
  final ValueChanged<OptionItem?>? onChanged;

  const ActivityTile({
    Key? key,
    this.option,
    this.selected = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(16.0),
      color: Get.theme.primaryColor.withOpacity(selected == true ? 0.15 : 0.05),
      child: InkWell(
        onTap: () => onChanged?.call(option),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MarkdownBody(data: '${option?.content}'),
        ),
      ),
    );
  }
}
