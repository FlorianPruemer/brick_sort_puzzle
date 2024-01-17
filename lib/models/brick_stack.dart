import 'package:meta/meta.dart';
import 'brick.dart';

@immutable
class BrickStack {
  final List<Brick> bricks;

  const BrickStack({required this.bricks});

  /// Pushes a list of bricks onto the stack
  void push(List<Brick> newBricks) => bricks.addAll(newBricks);

  /// Pops a sequence of consecutive bricks from the top of the stack.
  List<Brick> pop() {
    List<Brick> oldBricks = [];
    for (Brick brick in [...bricks.reversed]) {
      if (oldBricks.isEmpty || brick.colorIndex == oldBricks.last.colorIndex) {
        oldBricks.add(bricks.removeLast());
      } else {
        break;
      }
    }
    return oldBricks;
  }

  /// Returns the size of the last consecutive sequence of bricks on the stack.
  int lastElementSize() {
    List<Brick> lastBricks = [];
    for (Brick brick in bricks.reversed) {
      if (lastBricks.isEmpty ||
          brick.colorIndex == lastBricks.last.colorIndex) {
        lastBricks.add(brick);
      } else {
        break;
      }
    }
    return lastBricks.length;
  }

  bool get isEmpty => bricks.isEmpty;

  bool get isNotEmpty => bricks.isNotEmpty;

  @override
  String toString() => bricks.map((brick) => brick.toString()).join('\n');
}
