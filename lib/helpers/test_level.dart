import '../models/brick.dart';
import '../models/brick_stack.dart';

class TestLevel {
  BrickStack brickStack = BrickStack(bricks: [
    Brick(colorIndex: 0),
    Brick(colorIndex: 0),
    Brick(colorIndex: 1),
    Brick(colorIndex: 1),
  ]);

  BrickStack brickStack2 = BrickStack(bricks: [
    Brick(colorIndex: 1),
    Brick(colorIndex: 1),
    Brick(colorIndex: 2),
    Brick(colorIndex: 2),
  ]);

  BrickStack brickStack3 = BrickStack(bricks: [
    Brick(colorIndex: 2),
    Brick(colorIndex: 2),
    Brick(colorIndex: 3),
    Brick(colorIndex: 3),
  ]);

  BrickStack brickStack4 = BrickStack(bricks: [
    Brick(colorIndex: 3),
    Brick(colorIndex: 3),
    Brick(colorIndex: 4),
    Brick(colorIndex: 4),
  ]);

  BrickStack brickStack5 = BrickStack(bricks: [
    Brick(colorIndex: 4),
    Brick(colorIndex: 4),
    Brick(colorIndex: 5),
    Brick(colorIndex: 5),
  ]);

  BrickStack brickStack6 = BrickStack(bricks: [
    Brick(colorIndex: 5),
    Brick(colorIndex: 5),
    Brick(colorIndex: 6),
    Brick(colorIndex: 6),
  ]);

  BrickStack brickStack7 = BrickStack(bricks: [
    Brick(colorIndex: 6),
    Brick(colorIndex: 6),
    Brick(colorIndex: 7),
    Brick(colorIndex: 7),
  ]);

  BrickStack brickStack8 = BrickStack(bricks: [
    Brick(colorIndex: 7),
    Brick(colorIndex: 7),
    Brick(colorIndex: 8),
    Brick(colorIndex: 8),
  ]);

  BrickStack brickStack9 = BrickStack(bricks: [
    Brick(colorIndex: 8),
    Brick(colorIndex: 8),
    Brick(colorIndex: 9),
    Brick(colorIndex: 9),
  ]);

  BrickStack brickStack10 = BrickStack(bricks: [
    Brick(colorIndex: 10),
    Brick(colorIndex: 10),
    Brick(colorIndex: 11),
    Brick(colorIndex: 11),
  ]);

  BrickStack brickStack11 = BrickStack(bricks: [
    Brick(colorIndex: 3),
    Brick(colorIndex: 3),
    Brick(colorIndex: 7),
    Brick(colorIndex: 7),
  ]);

  BrickStack brickStack12 = BrickStack(bricks: []);

  BrickStack brickStack13 = BrickStack(bricks: []);

  List<BrickStack> get brickStacks => [
        brickStack,
        brickStack2,
        brickStack3,
        brickStack4,
        brickStack5,
        brickStack6,
        brickStack7,
        brickStack8,
        brickStack9,
        brickStack10,
        brickStack11,
        brickStack12,
        brickStack13
      ];
}
