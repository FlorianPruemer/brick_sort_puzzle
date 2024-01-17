import 'package:flutter/material.dart';
import 'package:brick_sort_puzzle/helpers/decoration.dart' as decoration;

class BrickWidget extends StatelessWidget {
  const BrickWidget({super.key, required this.colorIndex});
  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: decoration.indexToColor(colorIndex),
    );
  }
}
