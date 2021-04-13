import 'package:flutter/material.dart';

class DraggableSource extends StatelessWidget {
  final ValueChanged<int>? onAccept;
  final bool Function(int?)? onWillAccept;

  const DraggableSource({
    Key? key,
    this.onAccept,
    this.onWillAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onAccept: onAccept,
      onWillAccept: onWillAccept,
      builder: (c, a, r) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.white10,
            width: 3,
          ),
        ),
        height: 60,
        margin: const EdgeInsets.all(16.0),
        child: Center(
          child: Text('drag here'),
        ),
      ),
    );
  }
}
