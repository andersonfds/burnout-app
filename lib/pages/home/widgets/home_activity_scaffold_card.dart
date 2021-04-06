import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeActivityScaffoldCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Card(
        color: Colors.grey.shade600,
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              color: Colors.black,
                              width: 100,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Container(
                                  height: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Flexible(child: Container()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
