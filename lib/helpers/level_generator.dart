import 'package:brick_sort_puzzle/models/brick.dart';
import 'package:brick_sort_puzzle/models/brick_stack.dart';

class LevelGenerator {
  List<BrickStack> generateLevel(
      {int totalStacks = 11, int bricksPerStack = 4}) {
    List<int> temp = List.generate(
        totalStacks * bricksPerStack, (index) => (index ~/ bricksPerStack) + 1);
    temp.shuffle();
    List<List<int>> chunks = [];
    for (var i = 0; i < temp.length; i += bricksPerStack) {
      chunks.add(temp.skip(i).take(bricksPerStack).toList());
    }

    return [
      ...chunks.map((chunk) => BrickStack(
          bricks: List.generate(
              chunk.length, (index) => Brick(colorIndex: chunk[index])))),
      BrickStack(bricks: []),
      BrickStack(bricks: [])
    ];
  }
}
