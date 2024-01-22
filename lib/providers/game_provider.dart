import 'package:brick_sort_puzzle/helpers/level_generator.dart';
import 'package:brick_sort_puzzle/models/brick_stack.dart';
import 'package:brick_sort_puzzle/widgets/brick_stack_widget.dart';
import 'package:brick_sort_puzzle/widgets/brick_widget.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  late List<BrickStack> brickStacks;
  int stackIndex = -1;

  GameProvider() {
    brickStacks = LevelGenerator().generateLevel();
  }

  void setIndex(int index) {
    stackIndex = index;
    notifyListeners();
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
              index: stackIndex,
              onTap: () => _handleTap(stackIndex),
            ));
  }

  void _handleTap(int currentStackIndex) {
    if (stackIndex == currentStackIndex) {
      setIndex(-1);
    } else {
      if (stackIndex == -1) {
        setIndex(currentStackIndex);
      } else {
        performAction(giverIndex: stackIndex, receiverIndex: currentStackIndex);
        setIndex(-1);
      }
    }
  }

  void performAction({
    required int giverIndex,
    required int receiverIndex,
  }) {
    BrickStack giver = brickStacks[giverIndex];
    BrickStack receiver = brickStacks[receiverIndex];

    if (_legalMove(giver: giver, receiver: receiver)) {
      receiver.push(giver.pop());
    }
    notifyListeners();
  }

  bool _legalMove({
    required BrickStack giver,
    required BrickStack receiver,
  }) {
    return receiver.isEmpty ||
        (giver != receiver &&
            giver.isNotEmpty &&
            giver.bricks.last.colorIndex == receiver.bricks.last.colorIndex &&
            giver.lastElementSize() + receiver.bricks.length < 5);
  }
}
