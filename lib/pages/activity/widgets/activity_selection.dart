import 'package:flutter/material.dart';

import 'activity_tile.dart';

class ActivitySelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: ElevatedButton(onPressed: () {}, child: Text('Continuar')),
        ),
      ],
    );
  }
}
