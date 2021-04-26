import 'dart:math';

import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomeBottomActions extends StatelessWidget {
  final VoidCallback? onPlay;
  final VoidCallback? onUnlock;
  final bool locked;
  final int coins;
  final bool loading;

  const HomeBottomActions({
    Key? key,
    this.onPlay,
    this.coins = 0,
    this.onUnlock,
    this.locked = true,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0).copyWith(
        bottom: max(query.viewInsets.bottom, query.viewPadding.bottom) + 16,
      ),
      child: Container(
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [CoinIcon(coins: coins)],
              ),
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: loading ? null : (locked ? onUnlock : onPlay),
                label: Text(locked ? 'Desbloquear' : 'Jogar'),
                icon: loading
                    ? CircularProgressIndicator(
                        strokeWidth: 2,
                      )
                    : Icon(locked
                        ? AntDesign.lock
                        : Ionicons.md_game_controller_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
