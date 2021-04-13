import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: ElevatedButton(onPressed: () {}, child: Text('Continuar')),
        ),
      ],
    );
  }
}
