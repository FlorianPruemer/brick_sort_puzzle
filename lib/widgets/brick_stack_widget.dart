import 'dart:math';

import 'package:brick_sort_puzzle/widgets/brick_widget.dart';
import 'package:flutter/material.dart';

class BrickStackWidget extends StatelessWidget {
  const BrickStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 1],
          colors: [Colors.white, Color(0xff1d2d44)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      height: 160,
      width: 50,
      child: Column(verticalDirection: VerticalDirection.up, children: [
        BrickWidget(colorIndex: Random().nextInt(11) + 1),
        BrickWidget(colorIndex: Random().nextInt(11) + 1),
        BrickWidget(colorIndex: Random().nextInt(11) + 1),
        BrickWidget(colorIndex: Random().nextInt(11) + 1),
      ]),
    );
  }
}
