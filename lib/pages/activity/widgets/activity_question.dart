import 'package:app/shared/widgets/illustration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  'lorem ipsumd olor sit amet',
                  style: Get.textTheme?.headline5,
                ),
                Text(
                  'lorem ipsumd olor sit amet?',
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
                  child: OutlinedButton(onPressed: () {}, child: Text('Não'))),
              SizedBox(width: 10),
              Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('Sim'))),
            ],
          ),
        ),
      ],
    );
  }
}
