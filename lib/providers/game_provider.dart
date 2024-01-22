import 'package:brick_sort_puzzle/helpers/test_level.dart';
import 'package:brick_sort_puzzle/models/brick_stack.dart';
import 'package:brick_sort_puzzle/widgets/brick_stack_widget.dart';
import 'package:brick_sort_puzzle/widgets/brick_widget.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  late List<BrickStack> brickStacks;

  GameProvider() {
    brickStacks = TestLevel().brickStacks;
  }

  List<BrickStackWidget> createBrickStackWidgetList() {
    return List.generate(
        brickStacks.length,
        (stackIndex) => BrickStackWidget(
              bricks: List.generate(
                  brickStacks[stackIndex].bricks.length,
                  (brickIndex) => BrickWidget(
                      colorIndex: brickStacks[stackIndex]
                          .bricks[brickIndex]
                          .colorIndex)),
            ));
  }
}
