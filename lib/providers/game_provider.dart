import 'package:brick_sort_puzzle/helpers/level_generator.dart';
import 'package:brick_sort_puzzle/models/brick.dart';
import 'package:brick_sort_puzzle/models/brick_stack.dart';
import 'package:brick_sort_puzzle/widgets/brick_stack_widget.dart';
import 'package:brick_sort_puzzle/widgets/brick_widget.dart';
import 'package:brick_sort_puzzle/widgets/game_dialog.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  late List<BrickStack> brickStacks;
  int stackIndex = -1;
  bool _won = false;
  bool _lost = false;

  GameProvider() {
    brickStacks = LevelGenerator().generateLevel();
  }

  void setIndex(int index) {
    stackIndex = index;
    notifyListeners();
  }

  List<BrickStackWidget> createBrickStackWidgetList(
      BuildContext currentContext) {
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
              onTap: () => _handleTap(stackIndex, currentContext),
            ));
  }

  void _handleTap(int currentStackIndex, BuildContext currentContext) {
    if (!_won && !_lost) {
      if (stackIndex == currentStackIndex) {
        setIndex(-1);
      } else {
        if (stackIndex == -1) {
          setIndex(currentStackIndex);
        } else {
          performAction(
              giverIndex: stackIndex, receiverIndex: currentStackIndex);
          setIndex(-1);
        }
      }

      if (_won || _lost) {
        GameDialog.openGameDialog(
          currentContext,
          _won,
        );
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
      _checkForWin();
      _checkForLose();
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

  void _checkForWin() {
    _won = true;

    for (BrickStack brickStack in brickStacks) {
      if (brickStack.isNotEmpty) {
        if (brickStack.bricks.length < 4) {
          _won = false;
          break;
        }
        int colorIndex = brickStack.bricks.first.colorIndex;
        for (Brick brick in brickStack.bricks) {
          if (colorIndex != brick.colorIndex) {
            _won = false;
            break;
          }
        }
      }
      if (!_won) {
        break;
      }
    }
  }

  void _checkForLose() {
    _lost = true;

    for (BrickStack giver in brickStacks) {
      for (BrickStack receiver in brickStacks) {
        if (_legalMove(giver: giver, receiver: receiver)) {
          _lost = false;
          break;
        }
      }
      if (!_lost) {
        break;
      }
    }
  }

  void startNewLevel() {
    _won = false;
    _lost = false;
    brickStacks = LevelGenerator().generateLevel();
    notifyListeners();
  }
}
