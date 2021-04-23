import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeBottomActions extends StatelessWidget {
  final VoidCallback? onPlay;
  final int coins;

  const HomeBottomActions({
    Key? key,
    this.onPlay,
    this.coins = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                child: ElevatedButton(
                  onPressed: onPlay,
                  child: Text('Jogar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
